all: imgs stls

imgs: images/attack/main.png

images/attack/main.png: src/attack.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/attack/main.png \
	    --autocenter \
	    --viewall \
	    --imgsize 1920,1080 \
	    --render \
	    --projection p \
	    --colorscheme Sunset \
	    src/attack.scad

stls: stl/attack.stl

stl/attack.stl: src/attack.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/attack.stl \
	    src/attack.scad
