all: stls imgs

stls: icpstls macstls motherstls combinestls miscstls

imgs: icpimgs macimgs motherimgs combineimgs miscimgs

icpimgs: images/icp/attack.png \
    images/icp/science.png \
    images/icp/scout.png \
    images/icp/diplomat.png \
    images/icp/runabout.png \
    images/icp/tactical-shuttle.png

icpstls: stl/icp/attack.stl \
    stl/icp/diplomat.stl \
    stl/icp/runabout.stl \
    stl/icp/tactical-shuttle.stl \
    stl/icp/science.stl \
    stl/icp/scout.stl 

stl/icp/attack.stl: src/icp/attack.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/attack.stl \
	    src/icp/attack.scad

images/icp/attack.png: stl/icp/attack.stl
	bin/render.sh \
	    src/icp/attack.scad \
	    images/icp/attack.png \
	    Sunset

stl/icp/diplomat.stl: src/icp/diplomatic.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/diplomat.stl \
	    src/icp/diplomatic.scad

images/icp/diplomat.png: stl/icp/diplomat.stl
	bin/render.sh \
	    src/icp/diplomatic.scad \
	    images/icp/diplomat.png \
	    Tomorrow


stl/icp/runabout.stl: src/icp/runabout.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/runabout.stl \
	    src/icp/runabout.scad

images/icp/runabout.png: stl/icp/runabout.stl
	bin/render.sh \
	    src/icp/runabout.scad \
	    images/icp/runabout.png \
	    Cornfield

stl/icp/tactical-shuttle.stl: src/icp/tactical-runabout.scad \
    src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/tactical-shuttle.stl \
	    src/icp/tactical-runabout.scad

images/icp/tactical-shuttle.png: stl/icp/tactical-shuttle.stl
	bin/render.sh \
	    src/icp/tactical-runabout.scad \
	    images/icp/tactical-shuttle.png \
	    Solarized

stl/icp/science.stl: src/icp/science.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/science.stl \
	    src/icp/science.scad

images/icp/science.png: stl/icp/science.stl
	bin/render.sh \
	    src/icp/science.scad \
	    images/icp/science.png \
	    Metallic

stl/icp/scout.stl: src/icp/scout.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/scout.stl \
	    src/icp/scout.scad

images/icp/scout.png: stl/icp/scout.stl
	bin/render.sh \
	    src/icp/scout.scad \
	    images/icp/scout.png \
	    "Tomorrow Night"

macstls: stl/macs/shuttlepod.stl \
    stl/macs/shuttle.stl \
    stl/macs/small-runabout.stl \
    stl/macs/cutter.stl \
    stl/macs/heavy-runabout.stl \
    stl/macs/hospital.stl \
    stl/macs/freighter.stl

macimgs: images/macs/pod.png \
    images/macs/shuttle.png \
    images/macs/small-runabout.png \
    images/macs/cutter.png \
    images/macs/heavy-runabout.png \
    images/macs/hospital.png \
    images/macs/freighter.png

stl/macs/shuttlepod.stl: src/macs/macs.scad src/macs/shuttlepod.scad \
    src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/shuttlepod.stl \
	    src/macs/shuttlepod.scad

images/macs/pod.png: stl/macs/shuttlepod.stl
	bin/render.sh \
	    src/macs/shuttlepod.scad \
	    images/macs/pod.png \
	    "BeforeDawn"

stl/macs/shuttle.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/shuttle.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/shuttle.stl \
	    src/macs/shuttle.scad

images/macs/shuttle.png: stl/macs/shuttle.stl
	bin/render.sh \
	    src/macs/shuttle.scad \
	    images/macs/shuttle.png \
	    "BeforeDawn"

stl/macs/small-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/runabout.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/small-runabout.stl \
	    src/macs/runabout.scad

images/macs/small-runabout.png: stl/macs/small-runabout.stl
	bin/render.sh \
	    src/macs/runabout.scad \
	    images/macs/small-runabout.png \
	    "BeforeDawn"

stl/macs/cutter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/cutter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/cutter.stl \
	    src/macs/cutter.scad

images/macs/cutter.png: stl/macs/cutter.stl
	bin/render.sh \
	    src/macs/cutter.scad \
	    images/macs/cutter.png \
	    "BeforeDawn"

stl/macs/heavy-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/heavy.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/heavy-runabout.stl \
	    src/macs/heavy.scad

images/macs/heavy-runabout.png: stl/macs/heavy-runabout.stl
	bin/render.sh \
	    src/macs/heavy.scad \
	    images/macs/heavy-runabout.png \
	    "BeforeDawn"

stl/macs/hospital.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/hospital.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/hospital.stl \
	    src/macs/hospital.scad

images/macs/hospital.png: stl/macs/hospital.stl
	bin/render.sh \
	    src/macs/hospital.scad \
	    images/macs/hospital.png \
	    Metallic

stl/macs/freighter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/freighter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/freighter.stl \
	    src/macs/freighter.scad

images/macs/freighter.png: stl/macs/freighter.stl
	bin/render.sh \
	    src/macs/freighter.scad \
	    images/macs/freighter.png \
	    Nature

miscstls: stl/misc/cruiser.stl \
    stl/misc/cruiser2.stl

miscimgs: images/misc/cruiser.png \
    images/misc/cruiser2.png

stl/misc/cruiser.stl: src/lib/util.scad src/misc/cruiser.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/misc/cruiser.stl \
	    src/misc/cruiser.scad

images/misc/cruiser.png: stl/misc/cruiser.stl
	bin/render.sh \
	    src/misc/cruiser.scad \
	    images/misc/cruiser.png \
	    DeepOcean

stl/misc/cruiser2.stl: src/lib/util.scad src/misc/cruiser2.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/misc/cruiser2.stl \
	    src/misc/cruiser2.scad

images/misc/cruiser2.png: stl/misc/cruiser2.stl
	bin/render.sh \
	    src/misc/cruiser2.scad \
	    images/misc/cruiser2.png \
	    Cornfield


motherstls: stl/mother/scout.stl \
    stl/mother/saucer.stl \
    stl/mother/transwarp.stl \
    stl/mother/hangar.stl \
    stl/mother/escort.stl \
    stl/mother/main.stl \
    stl/mother/separation.stl \
    stl/mother/normal-separation.stl \
    stl/mother/starbase.stl \
    stl/mother/starship.stl

motherimgs: images/mothership/scout.png \
    images/mothership/saucer.png \
    images/mothership/transwarp.png \
    images/mothership/hangar.png \
    images/mothership/escort.png \
    images/mothership/main.png \
    images/mothership/separation.png \
    images/mothership/normal-separation.png \
    images/mothership/starbase.png \
    images/mothership/starship.png

stl/mother/scout.stl: src/lib/util.scad src src/mother/scout.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/scout.stl \
	    src/mother/scout.scad

images/mothership/scout.png: stl/mother/scout.stl
	bin/render.sh \
	    src/mother/scout.scad \
	    images/mothership/scout.png \
	    Tomorrow


stl/mother/transwarp.stl: src/lib/util.scad src src/mother/transwarp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/transwarp.stl \
	    src/mother/transwarp.scad

images/mothership/transwarp.png: stl/mother/transwarp.stl
	bin/render.sh \
	    src/mother/transwarp.scad \
	    images/mothership/transwarp.png \
	    Tomorrow

stl/mother/hangar.stl: src/lib/util.scad src src/mother/hangar.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/hangar.stl \
	    src/mother/hangar.scad

images/mothership/hangar.png: stl/mother/hangar.stl
	bin/render.sh \
	    src/mother/hangar.scad \
	    images/mothership/hangar.png \
	    Tomorrow

stl/mother/saucer.stl: src/lib/util.scad src src/mother/saucer.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/saucer.stl \
	    src/mother/saucer.scad

images/mothership/saucer.png: stl/mother/saucer.stl
	bin/render.sh \
	    src/mother/saucer.scad \
	    images/mothership/saucer.png \
	    Tomorrow

stl/mother/escort.stl: src/lib/util.scad src src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/escort.stl \
	    src/mother/escort.scad

images/mothership/escort.png: stl/mother/escort.stl
	bin/render.sh \
	    src/mother/escort.scad \
	    images/mothership/escort.png \
	    Tomorrow

stl/mother/main.stl: src/lib/util.scad src src/mother/main.scad\
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/main.stl \
	    src/mother/main.scad

images/mothership/main.png: stl/mother/main.stl
	bin/render.sh \
	    src/mother/main.scad \
	    images/mothership/main.png \
	    Tomorrow

stl/mother/separation.stl: src/lib/util.scad src \
    src/mother/separation.scad \
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/separation.stl \
	    src/mother/separation.scad

images/mothership/separation.png: stl/mother/separation.stl
	bin/render.sh \
	    src/mother/separation.scad \
	    images/mothership/separation.png \
	    Tomorrow

stl/mother/normal-separation.stl: src/lib/util.scad src \
    src/mother/normal-separation.scad \
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/normal-separation.stl \
	    src/mother/normal-separation.scad

images/mothership/normal-separation.png: stl/mother/normal-separation.stl
	bin/render.sh \
	    src/mother/normal-separation.scad \
	    images/mothership/normal-separation.png \
	    Tomorrow

stl/mother/starbase.stl: src/lib/util.scad src src/mother/starbase.scad \
    src/mother/saucer.scad src/mother/hangar.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/starbase.stl \
	    src/mother/starbase.scad

images/mothership/starbase.png: stl/mother/starbase.stl
	bin/render.sh \
	    src/mother/starbase.scad \
	    images/mothership/starbase.png \
	    Tomorrow

stl/mother/starship.stl: src/lib/util.scad src src/mother/starship.scad \
    src/mother/scout.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/starship.stl \
	    src/mother/starship.scad

images/mothership/starship.png: stl/mother/starship.stl
	bin/render.sh \
	    src/mother/starship.scad \
	    images/mothership/starship.png \
	    Tomorrow

combinestls: stl/combined/scale.stl

combineimgs: images/combined/scale.png

stl/combined/scale.stl: src/lib/util.scad \
    src/mother/main.scad \
    stl/mother/main.stl \
    src/mother/separation.scad \
    stl/mother/separation.stl \
    src/macs/macs.scad \
    src/macs/shuttle.scad \
    src/macs/runabout.scad \
    src/macs/cutter.scad \
    src/macs/heavy.scad \
    src/icp/runabout.scad \
    src/icp/science.scad \
    src/icp/scout.scad \
    src/icp/diplomatic.scad \
    src/icp/attack.scad \
    src/icp/tactical-runabout.scad \
    src/macs/hospital.scad \
    src/combined/scale.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/combined/scale.stl \
	    src/combined/scale.scad

images/combined/scale.png: stl/combined/scale.stl
	bin/render.sh \
	    src/combined/scale.scad \
	    images/combined/scale.png \
	    BeforeDawn

