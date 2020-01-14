all: stls

stls: stl/attack.stl

stl/attack.stl: src/attack/attack.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/attack.stl \
	    src/attack/attack.scad
