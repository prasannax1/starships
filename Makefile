all: icpstls macstls

icpstls: stl/attack.stl stl/diplomat.stl

stl/attack.stl: src/attack/attack.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/attack.stl \
	    src/attack/attack.scad

stl/diplomat.stl: src/diplomat/diplomatic.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/diplomat.stl \
	    src/diplomat/diplomatic.scad

macstls: stl/macs/shuttlepod.stl \
    stl/macs/shuttle.stl \
    stl/macs/small-runabout.stl \
    stl/macs/cutter.stl \
    stl/macs/heavy-runabout.stl \
    stl/macs/hospital.stl \
    stl/macs/freighter.stl

stl/macs/shuttlepod.stl: src/macs/macs.scad src/macs/shuttlepod.scad \
    src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/shuttlepod.stl \
	    src/macs/shuttlepod.scad

stl/macs/shuttle.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/shuttle.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/shuttle.stl \
	    src/macs/shuttle.scad

stl/macs/small-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/runabout.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/small-runabout.stl \
	    src/macs/runabout.scad

stl/macs/cutter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/cutter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/cutter.stl \
	    src/macs/cutter.scad

stl/macs/heavy-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/heavy.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/heavy-runabout.stl \
	    src/macs/heavy.scad

stl/macs/hospital.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/hospital.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/hospital.stl \
	    src/macs/hospital.scad

stl/macs/freighter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/freighter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/freighter.stl \
	    src/macs/freighter.scad



