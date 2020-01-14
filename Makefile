all: icpstls macstls

icpstls: stl/icp/attack.stl \
    stl/icp/diplomat.stl \
    stl/icp/runabout.stl \
    stl/icp/tactical-shuttle.stl \
    stl/icp/science.stl \
    stl/icp/scout.stl 

stl/icp/attack.stl: src/icp/attack.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/attack.stl \
	    src/icp/attack.scad

stl/icp/diplomat.stl: src/icp/diplomatic.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/diplomat.stl \
	    src/icp/diplomatic.scad

stl/icp/runabout.stl: src/icp/runabout.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/runabout.stl \
	    src/icp/runabout.scad

stl/icp/tactical-shuttle.stl: src/icp/tactical-runabout.scad \
    src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/tactical-shuttle.stl \
	    src/icp/tactical-runabout.scad

stl/icp/science.stl: src/icp/science.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/science.stl \
	    src/icp/science.scad

stl/icp/scout.stl: src/icp/scout.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/scout.stl \
	    src/icp/scout.scad

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



