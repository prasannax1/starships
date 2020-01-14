all: icpstls

icpstls: stl/attack.stl stl/diplomat.stl

stl/attack.stl: src/attack/attack.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/attack.stl \
	    src/attack/attack.scad

stl/diplomat.stl: src/diplomat/diplomatic.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/diplomat.stl \
	    src/diplomat/diplomatic.scad
