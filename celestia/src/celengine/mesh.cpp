// mesh.cpp
//
// Copyright (C) 2004, Chris Laurel <claurel@shatters.net>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.

#include "mesh.h"
#include "gl.h"
#include "glext.h"
#include "vecgl.h"
#include <cassert>
#include <iostream>

using namespace std;



static GLenum GLPrimitiveModes[Mesh::PrimitiveTypeMax] = 
{
    GL_TRIANGLES,
    GL_TRIANGLE_STRIP,
    GL_TRIANGLE_FAN,
    GL_LINES,
    GL_LINE_STRIP,
    GL_POINTS
};

static GLenum GLComponentTypes[Mesh::FormatMax] = 
{
     GL_FLOAT,          // Float1
     GL_FLOAT,          // Float2
     GL_FLOAT,          // Float3
     GL_FLOAT,          // Float4,
     GL_UNSIGNED_BYTE,  // UByte4
};

static int GLComponentCounts[Mesh::FormatMax] =
{
     1,  // Float1
     2,  // Float2
     3,  // Float3
     4,  // Float4,
     4,  // UByte4
};

static size_t VertexAttributeFormatSizes[Mesh::FormatMax] = 
{
     4,  // Float1
     8,  // Float2
     12, // Float3
     16, // Float4,
     4,  // UByte4
};


Mesh::Mesh() :
    vertexStride(0),
    nVertices(0),
    vertices(NULL)
{
    for (int i = 0; i < (int) SemanticMax; i++)
        vertexAttributeMap[i].format = InvalidFormat;
}


Mesh::~Mesh()
{
    for (vector<PrimitiveGroup*>::iterator iter = groups.begin();
         iter != groups.end(); iter++)
    {
        delete *iter;
    }

    if (vertices != NULL)
        delete vertices;
}


void
Mesh::setVertices(uint32 _nVertices, void* vertexData)
{
    nVertices = _nVertices;
    vertices = vertexData;
}


bool
Mesh::setVertexDescription(const VertexDescription& desc)
{
    uint32 i;

    if (desc.stride == 0 || desc.stride % 4 != 0)
        return false;

    // Clear the existing vertex description
    for (i = 0; i < (uint32) SemanticMax; i++)
    {
        vertexAttributeMap[i] = VertexAttribute(InvalidSemantic,
                                                InvalidFormat, 0);
    }
    
    vertexStride = desc.stride;

    // Build a vertex attribute table that's indexed by semnatic; this is the
    // desired structure for setting up GL.
    // TODO: Modify this so that we don't have to just use predefined semantics
    for (i = 0; i < desc.nAttributes; i++)
    {
        VertexAttribute* attr = &desc.attributes[i];

        // Validate the attribute
        if (attr->semantic >= SemanticMax || attr->format >= FormatMax)
            return false;
        if (attr->offset % 4 != 0)
            return false;
        if (attr->offset + VertexAttributeFormatSizes[attr->format] > vertexStride)
            return false;
        if (vertexAttributeMap[attr->semantic].format != InvalidFormat)
            return false;
        
        vertexAttributeMap[attr->semantic] = *attr;
    }

    // Require that we at least have position defined.
    if (vertexAttributeMap[Position].format == InvalidFormat)
        return false;

    return true;
}


const Mesh::PrimitiveGroup*
Mesh::getGroup(uint32 index) const
{
    return groups[index];
}


uint32
Mesh::addGroup(PrimitiveGroupType prim,
               uint32 materialIndex,
               uint32 nIndices,
               uint32* indices)
{
    PrimitiveGroup* g = new PrimitiveGroup();
    g->prim = prim;
    g->materialIndex = materialIndex;
    g->nIndices = nIndices;
    g->indices = indices;
    groups.push_back(g);

    return groups.size();
}


bool
Mesh::pick(const Ray3d& ray, double& distance) const
{
    double maxDistance = 1.0e30;
    double closest = maxDistance;

    // Pick will automatically fail without vertex positions--no reasonable
    // mesh should lack these.
    if (vertexAttributeMap[Position].semantic != Position ||
        vertexAttributeMap[Position].format != Float3)
    {
        return false;
    }

    uint posOffset = vertexAttributeMap[Position].offset;
    char* vdata = reinterpret_cast<char*>(vertices);

    // Iterate over all primitive groups in the mesh
    for (vector<PrimitiveGroup*>::const_iterator iter = groups.begin();
         iter != groups.end(); iter++)
    {
        Mesh::PrimitiveGroupType primType = (*iter)->prim;
        uint32 nIndices = (*iter)->nIndices;

        // Only attempt to compute the intersection of the ray with triangl
        // groups.
        if ((primType == TriList || primType == TriStrip || primType == TriFan) &&
            (nIndices >= 3) &&
            !(primType == TriList && nIndices % 3 != 0))
        {
            uint32 index = 0;
            uint32 i0 = (*iter)->indices[0];
            uint32 i1 = (*iter)->indices[1];
            uint32 i2 = (*iter)->indices[2];
            
            // Iterate over the triangles in the primitive group
            do
            {
                // Get the triangle vertices v0, v1, and v2
                float* f0 = reinterpret_cast<float*>(vdata + i0 * vertexStride + posOffset);
                float* f1 = reinterpret_cast<float*>(vdata + i1 * vertexStride + posOffset);
                float* f2 = reinterpret_cast<float*>(vdata + i2 * vertexStride + posOffset);
                Point3d v0(f0[0], f0[1], f0[2]);
                Point3d v1(f1[0], f1[1], f1[2]);
                Point3d v2(f2[0], f2[1], f2[2]);

                // Compute the edge vectors e0 and e1, and the normal n
                Vec3d e0 = v1 - v0;
                Vec3d e1 = v2 - v0;
                Vec3d n = e0 ^ e1;

                // c is the cosine of the angle between the ray and triangle normal
                double c = n * ray.direction;

                // If the ray is parallel to the triangle, it either misses the
                // triangle completely, or is contained in the triangle's plane.
                // If it's contained in the plane, we'll still call it a miss.
                if (c != 0.0)
                {
                    double t = (n * (v0 - ray.origin)) / c;
                    if (t < closest && t > 0.0)
                    {
                        double m00 = e0 * e0;
                        double m01 = e0 * e1;
                        double m10 = e1 * e0;
                        double m11 = e1 * e1;
                        double det = m00 * m11 - m01 * m10;
                        if (det != 0.0)
                        {
                            Point3d p = ray.point(t);
                            Vec3d q = p - v0;
                            double q0 = e0 * q;
                            double q1 = e1 * q;
                            double d = 1.0 / det;
                            double s0 = (m11 * q0 - m01 * q1) * d;
                            double s1 = (m00 * q1 - m10 * q0) * d;
                            if (s0 >= 0.0 && s1 >= 0.0 && s0 + s1 <= 1.0)
                                closest = t;
                        }
                    }
                }

                // Get the indices for the next triangle
                if (primType == TriList)
                {
                    index += 3;
                    if (index < nIndices)
                    {
                        i0 = (*iter)->indices[index + 0];
                        i1 = (*iter)->indices[index + 1];
                        i2 = (*iter)->indices[index + 2];
                    }
                }
                else if (primType == TriStrip)
                {
                    index += 1;
                    if (index < nIndices)
                    {
                        i0 = i1;
                        i1 = i2;
                        i2 = (*iter)->indices[index];
                        // TODO: alternate orientation of triangles in a strip
                    }
                }
                else // primType == TriFan
                {
                    index += 1;
                    if (index < nIndices)
                    {
                        index += 1;
                        i1 = i2;
                        i2 = (*iter)->indices[index];
                    }
                }

            } while (index < nIndices);
        }
    }

    if (closest != maxDistance)
    {
        distance = closest;
        return true;
    }
    else
    {
        return false;
    }
}


void Mesh::render(const std::vector<const Material*>& materials) const
{
    // Can't render anything unless we have positions
    if (vertexAttributeMap[Position].format != Float3)
        return;

    cout << "Mesh::render\n";
    cout.flush();

    // Set up the vertex arrays
    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(3, GL_FLOAT, vertexStride,
                    reinterpret_cast<char*>(vertices) + vertexAttributeMap[Position].offset);

    cout << "VertexPointer: stride=" << vertexStride <<
        ", offset=" << vertexAttributeMap[Position].offset <<
        ", vertices=" << vertices << 
        ", nVertices=" << nVertices << '\n';
    cout.flush();


    // Set up the normal array
    switch (vertexAttributeMap[Normal].format)
    {
    case Float3:
        glEnableClientState(GL_NORMAL_ARRAY);
        glNormalPointer(GLComponentTypes[(int) vertexAttributeMap[Normal].format],
                        vertexStride,
                        reinterpret_cast<char*>(vertices) + vertexAttributeMap[Normal].offset);
        cout << "Normal offset=" << vertexAttributeMap[Normal].offset << '\n';
        break;
    default:
        glDisableClientState(GL_NORMAL_ARRAY);
        break;
    }

    // Set up the color array
    switch (vertexAttributeMap[Color0].format)
    {
    case Float3:
    case Float4:
    case UByte4:
        glEnableClientState(GL_COLOR_ARRAY);
        glColorPointer(GLComponentCounts[(int) vertexAttributeMap[Color0].format],
                       GLComponentTypes[(int) vertexAttributeMap[Color0].format],
                       vertexStride,
                       reinterpret_cast<char*>(vertices) + vertexAttributeMap[Color0].offset);
        cout << "Color0 offset=" << vertexAttributeMap[Color0].offset << '\n';
        break;
    default:
        glDisableClientState(GL_COLOR_ARRAY);
        break;
    }

    // Set up the texture coordinate array
    switch (vertexAttributeMap[Texture0].format)
    {
    case Float1:
    case Float2:
    case Float3:
    case Float4:
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glTexCoordPointer(GLComponentCounts[(int) vertexAttributeMap[Texture0].format],
                          GLComponentTypes[(int) vertexAttributeMap[Texture0].format],
                          vertexStride,
                          reinterpret_cast<char*>(vertices) + vertexAttributeMap[Texture0].offset);
        cout << "Texture0 offset=" << vertexAttributeMap[Texture0].offset << '\n';
        break;
    default:
        glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        break;
    }

    uint32 lastMaterial = ~0;

    // Iterate over all primitive groups in the mesh
    for (vector<PrimitiveGroup*>::const_iterator iter = groups.begin();
         iter != groups.end(); iter++)
    {
        // Set up the material
        uint32 materialIndex = (*iter)->materialIndex;
        if (materialIndex != lastMaterial &&
            materialIndex > 0 &&
            materialIndex <= materials.size())
        {
            glColor(materials[materialIndex - 1]->diffuse);
        }

        cout << "prim group: type=" << (*iter)->prim <<
            ", nIndices=" << (*iter)->nIndices <<
            ", indices=" << (*iter)->indices << '\n';
        cout.flush();

        glDrawElements(GLPrimitiveModes[(int) (*iter)->prim],
                       (*iter)->nIndices,
                       GL_UNSIGNED_INT,
                       (*iter)->indices);
        cout << "done\n";
        cout.flush();
    }
}



Mesh::PrimitiveGroupType
Mesh::parsePrimitiveGroupType(const string& name)
{
    if (name == "trilist")
        return TriList;
    else if (name == "tristrip")
        return TriStrip;
    else if (name == "trifan")
        return TriFan;
    else if (name == "linelist")
        return LineList;
    else if (name == "linestrip")
        return LineStrip;
    else if (name == "points")
        return PointList;
    else
        return InvalidPrimitiveGroupType;
}


Mesh::VertexAttributeSemantic
Mesh::parseVertexAttributeSemantic(const string& name)
{
    if (name == "pos")
        return Position;
    else if (name == "norm")
        return Normal;
    else if (name == "col0")
        return Color0;
    else if (name == "col1")
        return Color1;
    else if (name == "tan")
        return Tangent;
    else if (name == "tex0")
        return Texture0;
    else if (name == "tex1")
        return Texture0;
    else if (name == "tex2")
        return Texture0;
    else if (name == "tex3")
        return Texture0;
    else
        return InvalidSemantic;
}


Mesh::VertexAttributeFormat
Mesh::parseVertexAttributeFormat(const string& name)
{
    if (name == "f1")
        return Float1;
    else if (name == "f2")
        return Float2;
    else if (name == "f3")
        return Float3;
    else if (name == "f4")
        return Float4;
    else if (name == "ub4")
        return UByte4;
    else
        return InvalidFormat;
}


uint32
Mesh::getVertexAttributeSize(VertexAttributeFormat fmt)
{
    switch (fmt)
    {
    case Float1:
    case UByte4:
        return 4;
    case Float2:
        return 8;
    case Float3:
        return 12;
    case Float4:
        return 16;
    default:
        return 0;
    }

}
