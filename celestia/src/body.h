// body.h
//
// Copyright (C) 2001 Chris Laurel <claurel@shatters.net>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.

#ifndef _BODY_H_
#define _BODY_H_

#include <string>
#include <vector>
#include "color.h"
#include "surface.h"
#include "atmosphere.h"
#include "orbit.h"
#include "star.h"
#include "quaternion.h"


class Body;

class PlanetarySystem
{
 public:
    PlanetarySystem(Body* _primary);
    PlanetarySystem(const Star* _star);
    
    const Star* getStar() const { return star; };
    Body* getPrimaryBody() const { return primary; };
    int getSystemSize() const { return satellites.size(); };
    Body* getBody(int i) const { return satellites[i]; };
    void addBody(Body* body) { satellites.insert(satellites.end(), body); };

    enum TraversalResult
    {
        ContinueTraversal   = 0,
        StopTraversal       = 1
    };

    typedef bool (*TraversalFunc)(Body*, void*);

    bool traverse(TraversalFunc, void*) const;
    Body* find(std::string, bool deepSearch = false) const;

 private:
    const Star* star;
    Body* primary;
    std::vector<Body*> satellites;
};


class RingSystem 
{
 public:
    float innerRadius;
    float outerRadius;
    Color color;
    int texture;

    RingSystem(float inner, float outer) :
        innerRadius(inner), outerRadius(outer), color(1.0f, 1.0f, 1.0f), texture(-1)
        { }
    RingSystem(float inner, float outer, Color _color, int _texture = -1) :
        innerRadius(inner), outerRadius(outer), color(_color), texture(_texture)
        { }
};


class Body
{
 public:
    Body(PlanetarySystem*);

    PlanetarySystem* getSystem() const;
    std::string getName() const;
    void setName(const std::string);
    Orbit* getOrbit() const;
    void setOrbit(Orbit*);
    float getRadius() const;
    void setRadius(float);
    float getMass() const;
    void setMass(float);
    float getOblateness() const;
    void setOblateness(float);
    float getObliquity() const;
    void setObliquity(float);
    float getAlbedo() const;
    void setAlbedo(float);
    float getRotationPeriod() const;
    void setRotationPeriod(float);
    float getRotationPhase() const;
    void setRotationPhase(float);

    const PlanetarySystem* getSatellites() const;
    void setSatellites(PlanetarySystem*);

    RingSystem* getRings() const;
    void setRings(const RingSystem&);
    const Atmosphere* getAtmosphere() const;
    void setAtmosphere(const Atmosphere&);

    void setMesh(int);
    int getMesh() const;
    void setSurface(const Surface&);
    const Surface& getSurface() const;

    float getLuminosity(const Star& sun,
                        float distanceFromSun) const;
    float getApparentMagnitude(const Star& sun,
                               float distanceFromSun,
                               float distanceFromViewer) const;
    float getApparentMagnitude(const Star& sun,
                               const Vec3d& sunPosition,
                               const Vec3d& viewerPosition) const;

    Mat4d getLocalToHeliocentric(double when);
    Point3d getHeliocentricPosition(double when);
    Quatd getEquatorialToGeographic(double when);
    Quatd getEclipticalToEquatorial();
    Quatd getEclipticalToGeographic(double when);
    Mat4d getGeographicToHeliocentric(double when);

 private:
    std::string name;

    PlanetarySystem* system;
    Orbit* orbit;

    float radius;
    float mass;
    float oblateness;
    float obliquity; // aka 'axial tilt'
    float albedo;
    float rotationPeriod;
    float rotationPhase;

    ResourceHandle mesh;
    Surface surface;

    Atmosphere* atmosphere;
    RingSystem* rings;

    PlanetarySystem* satellites;
};

#endif // _BODY_H_

