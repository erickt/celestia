;
; Celestia Windows exe Build script, generated by the Inno Setup Script Wizard.

; This script was tested with Inno Setup Compiler version 4.0.10

[Setup]
AppName=Celestia
AppVerName=Celestia 1.3.2 pre6
AppPublisher=Shatters Software
AppPublisherURL=http://www.shatters.net/celestia/
AppSupportURL=http://www.shatters.net/celestia/
AppUpdatesURL=http://www.shatters.net/celestia/
DefaultDirName={pf}\Celestia
DefaultGroupName=Celestia
LicenseFile=C:\celestia\celestia\COPYING
Compression=lzma/max
UninstallDisplayIcon={app}\celestia.exe

; Tell Explorer to refresh its file associations information at the
; end of the installation, and Uninstall will do the same at the end
; of uninstallation.
ChangesAssociations=yes

; uncomment the following line if you want your installation to run on NT 3.51 too.
; MinVersion=4,3.51

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon";            GroupDescription: "Additional icons:"; MinVersion: 4,4
Name: "urlassoc";    Description: "Associate cel:// &URLs";            GroupDescription: "Other tasks:"
Name: "fileassoc";   Description: "Associate .cel and .celx &scripts"; GroupDescription: "Other tasks:"

[Dirs]
Name: "{app}\extras"
Name: "{app}\textures"
Name: "{app}\textures\hires"
Name: "{app}\textures\medres"
Name: "{app}\textures\lores"

[Files]
Source: "celestia.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "start.cel";    DestDir: "{app}"; Flags: ignoreversion
Source: "celestia.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "demo.cel";     DestDir: "{app}"; Flags: ignoreversion
Source: "guide.cel";    DestDir: "{app}"; Flags: ignoreversion
Source: "libpng1.dll";  DestDir: "{app}"; Flags: ignoreversion
Source: "zlib.dll";     DestDir: "{app}"; Flags: ignoreversion
Source: "controls.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "COPYING";      DestDir: "{app}"; Flags: ignoreversion
Source: "README";       DestDir: "{app}"; Flags: ignoreversion isreadme;   DestName: "README.txt"
Source: "AUTHORS";      DestDir: "{app}"; Flags: ignoreversion;            DestName: "AUTHORS.txt"
Source: "TRANSLATORS";  DestDir: "{app}"; Flags: ignoreversion;            DestName: "TRANSLATORS.txt"
Source: "ChangeLog";    DestDir: "{app}"; Flags: ignoreversion;            DestName: "ChangeLog.txt"
Source: "KbdMouseJoyControls.txt"; DestDir: "{app}"; Flags: ignoreversion


; Data
Source: "data\asterisms.dat";      DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\boundaries.dat";     DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\starnames.dat";      DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\stars.dat";          DestDir: "{app}/data"; Flags: ignoreversion

Source: "data\deepsky.dsc";        DestDir: "{app}/data"; Flags: ignoreversion

Source: "data\asteroids.ssc";      DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\comets.ssc";         DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\extrasolar.ssc";     DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\outersys.ssc";       DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\solarsys.ssc";       DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\solsys_locs.ssc";    DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\spacecraft.ssc";     DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\world-capitals.ssc"; DestDir: "{app}/data"; Flags: ignoreversion

Source: "data\cassini.xyz";        DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\galileo.xyz";        DestDir: "{app}/data"; Flags: ignoreversion
Source: "data\huygens.xyz";        DestDir: "{app}/data"; Flags: ignoreversion


; Textures (General)
Source: "textures\flare.jpg";      DestDir: "{app}/textures"; Flags: ignoreversion
Source: "textures\logo.png";       DestDir: "{app}/textures"; Flags: ignoreversion


; Textures (Low resolution)
Source: "textures\lores\astar.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\bstar.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\gstar.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mstar.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion

Source: "textures\lores\amalthea.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\ariel.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\ariel-lok-mask.png";    DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\asteroid.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\browndwarf.jpg";        DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\callisto.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\callisto-lok-mask.png"; DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\charon-lok.jpg";        DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\charon-lok-spec.jpg";   DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\deimos.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\dione.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\earth.png";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\earth-clouds.png";      DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\earthnight.jpg";        DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\enceladus.jpg";         DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\epimetheus.jpg";        DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\epimetheus-lok.jpg";    DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\eros.jpg";              DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\europa.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\europa-lok-mask.png";   DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\ganymede.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\ganymede-lok-mask.png"; DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\gasgiant.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\gasgiantnight.jpg";     DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\gaspramosaic.jpg";      DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\hyperion.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\hyperion-lok.jpg";      DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\iapetus.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\idamosaic.jpg";         DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\io.jpg";                DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\io-lok-mask.png";       DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\janus.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\jupiter.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\jupiterlike.jpg";       DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mars.jpg";              DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\marsbump.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mercury.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mercury-lok-mask.png";  DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mercurybump.jpg";       DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mimas.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\mimas-lok-mask.png";    DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\miranda.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\miranda-lok-mask.png";  DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\moon.jpg";              DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\moonbump.jpg";          DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\neptune.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\neptune-rings.png";     DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\oberon.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\oberon-lok-mask.png";   DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\phobos.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\pluto-lok.jpg";         DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\pluto-lok-spec.jpg";    DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\proteus.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\prometheus.jpg";        DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\rhea.jpg";              DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\saturn.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\saturn-rings.png";      DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\tethys.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\titania.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\titania-lok-mask.png";  DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\titan.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\triton.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\triton-lok-mask.png";   DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\umbriel.jpg";           DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\umbriel-lok-mask.png";  DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\uranus.jpg";            DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\uranus-rings.png";      DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\venus.jpg";             DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\venuslike.jpg";         DestDir: "{app}/textures/lores"; Flags: ignoreversion
Source: "textures\lores\venussurface.jpg";      DestDir: "{app}/textures/lores"; Flags: ignoreversion


; Textures (Medium resolution)
Source: "textures\medres\astar.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\bstar.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\gstar.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\mstar.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion

Source: "textures\medres\amalthea.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\ariel.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\asteroid.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\browndwarf.jpg";      DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\callisto.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\charon-lok.jpg";      DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\charon-lok-spec.jpg"; DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\deimos.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\dione.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\earth.png";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\earth-clouds.png";    DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\earthnight.jpg";      DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\enceladus.jpg";       DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\epimetheus.jpg";      DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\epimetheus-lok.jpg";  DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\eros.jpg";            DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\europa.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\ganymede.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\gasgiant.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\gasgiantnight.jpg";   DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\gaspramosaic.jpg";    DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\hyperion.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\hyperion-lok.jpg";    DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\iapetus.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\idamosaic.jpg";       DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\io.jpg";              DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\iss-cap1.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\iss-mc1.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\iss-mc31.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\iss-sol1.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\janus.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\jupiter.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\jupiterlike.jpg";     DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\mars.jpg";            DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\marsbump.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\mercury.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\mercurybump.jpg";     DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\mimas.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\miranda.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\moon.jpg";            DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\moonbump.jpg";        DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\neptune.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\oberon.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\phobos.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\pluto-lok.jpg";       DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\pluto-lok-spec.jpg";  DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\prometheus.jpg";      DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\proteus.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\rhea.jpg";            DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\saturn.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\tethys.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\titania.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\triton.jpg";          DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\umbriel.jpg";         DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\venus.jpg";           DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\venuslike.jpg";       DestDir: "{app}/textures/medres"; Flags: ignoreversion
Source: "textures\medres\venussurface.jpg";    DestDir: "{app}/textures/medres"; Flags: ignoreversion


; Shaders (NV)
Source: "shaders\bumpdiffuse.vp";    DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\bumphaze.vp";       DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\diffuse.vp";        DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\diffuse_texoff.vp"; DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\haze.vp";           DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\night.vp";          DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\rings.vp";          DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\ringshadow.vp";     DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\shadowtex.vp";      DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\simple.vp";         DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\specular.vp";       DestDir: "{app}/shaders"; Flags: ignoreversion


; Shaders (ARB)
Source: "shaders\bumpdiffuse_arb.vp";    DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\bumphaze_arb.vp";       DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\diffuse_arb.vp";        DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\diffuse_texoff_arb.vp"; DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\glossmap_arb.vp";       DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\haze_arb.vp";           DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\multishadow_arb.vp";    DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\night_arb.vp";          DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\rings_arb.vp";          DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\ringshadow_arb.vp";     DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\shadowtex_arb.vp";      DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\simple_arb.vp";         DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\specular_arb.vp";       DestDir: "{app}/shaders"; Flags: ignoreversion


; Shaders (NV pixel)
Source: "shaders\eclipse1_nv.fp";        DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\eclipse2_nv.fp";        DestDir: "{app}/shaders"; Flags: ignoreversion
Source: "shaders\shadow_on_rings_nv.fp"; DestDir: "{app}/shaders"; Flags: ignoreversion


; Models
;Source: "models\amalthea.3ds";     DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\amalthea.cmod";    DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\asteroid.cms";     DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\bacchus.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\borrelly.cms";     DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\cassini.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\castalia.3ds";     DestDir: "{app}/models"; Flags: ignoreversion
;Source: "models\deimos.3ds";       DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\deimos.cmod";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\epimetheus.3ds";   DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\eros.3ds";         DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\galileo.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\gaspra.3ds";       DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\geographos.3ds";   DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\golevka.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\halley.3ds";       DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\hubble.3ds";       DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\huygens.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
;Source: "models\hyperion.3ds";     DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\hyperion.cmod";    DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\ida.3ds";          DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\iss.3ds";          DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\janus.3ds";        DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\kleopatra.3ds";    DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\ky26.3ds";         DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\larissa.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\mir.3ds";          DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\pandora.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
;Source: "models\phobos.3ds";       DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\phobos.cmod";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\prometheus.3ds";   DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\proteus.3ds";      DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\roughsphere.cms";  DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\toutatis.3ds";     DestDir: "{app}/models"; Flags: ignoreversion
Source: "models\vesta.3ds";        DestDir: "{app}/models"; Flags: ignoreversion


; Fonts
Source: "fonts\clean12.txf";     DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\clean16.txf";     DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\cleanbold12.txf"; DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\cleanbold16.txf"; DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\default.txf";     DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sans10.txf";      DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sans12.txf";      DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sans14.txf";      DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sans20.txf";      DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sansbold10.txf";  DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sansbold12.txf";  DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sansbold14.txf";  DestDir: "{app}/fonts"; Flags: ignoreversion
Source: "fonts\sansbold20.txf";  DestDir: "{app}/fonts"; Flags: ignoreversion

; Standard extras
Source: "extras\minormoons.ssc"; DestDir: "{app}/extras"; Flags: ignoreversion

[INI]
Filename: "{app}\celestia.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.shatters.net/celestia/"

[Icons]
Name: "{group}\Celestia";            Filename: "{app}\celestia.exe"; WorkingDir: "{app}"
Name: "{group}\README";              Filename: "{app}\README.txt"
Name: "{group}\Celestia on the Web"; Filename: "{app}\celestia.url"
Name: "{userdesktop}\Celestia";      Filename: "{app}\celestia.exe"; WorkingDir: "{app}"; MinVersion: 4,4; Tasks: desktopicon

[Registry]
; The Software\Shatters.net key is created by the Celestia program, so it needs
; to be deleted during an uninstall.
Root: HKCU; Subkey: "Software\Shatters.net"; Flags: uninsdeletekey

Root: HKCR; Subkey: "cel"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "cel"; ValueType: string; ValueData: "URL:cel Protocol"; Tasks: urlassoc; Flags: uninsdeletevalue
Root: HKCR; Subkey: "cel"; ValueName: "URL Protocol"; ValueType: string; Tasks: urlassoc; Flags: uninsdeletevalue

Root: HKCR; Subkey: "cel\Shell"; ValueType: string; Tasks: urlassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "cel\Shell\open"; ValueType: string; Tasks: urlassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "cel\Shell\open\Command"; ValueType: string; ValueData: """{app}\celestia.exe"" --once --dir ""{app}"" -u ""%1"""; Tasks: urlassoc; Flags: uninsdeletevalue uninsdeletekeyifempty

Root: HKCR; Subkey: ".cel";  ValueType: string; ValueData: "celestia_script"; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: ".clx";  ValueType: string; ValueData: "celestia_script"; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: ".celx"; ValueType: string; ValueData: "celestia_script"; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty

Root: HKCR; Subkey: "celestia_script"; ValueName: "URL Protocol"; ValueType: string; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "celestia_script\Shell"; ValueType: string; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "celestia_script\Shell\open"; ValueType: string; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCR; Subkey: "celestia_script\Shell\open\Command"; ValueType: string; ValueData: """{app}\celestia.exe"" --once --dir ""{app}"" -u ""%1"""; Tasks: fileassoc; Flags: uninsdeletevalue uninsdeletekeyifempty


[Run]
Filename: "{app}\celestia.exe"; Description: "Launch Celestia"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\celestia.url"

