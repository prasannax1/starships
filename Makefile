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
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/attack.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme Sunset \
	    src/icp/attack.scad

stl/icp/diplomat.stl: src/icp/diplomatic.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/diplomat.stl \
	    src/icp/diplomatic.scad

images/icp/diplomat.png: stl/icp/diplomat.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/diplomat.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/icp/diplomatic.scad

stl/icp/runabout.stl: src/icp/runabout.scad src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/runabout.stl \
	    src/icp/runabout.scad

images/icp/runabout.png: stl/icp/runabout.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/runabout.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Cornfield" \
	    src/icp/runabout.scad

stl/icp/tactical-shuttle.stl: src/icp/tactical-runabout.scad \
    src/lib/util.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/tactical-shuttle.stl \
	    src/icp/tactical-runabout.scad

images/icp/tactical-shuttle.png: stl/icp/tactical-shuttle.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/tactical-shuttle.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Solarized" \
	    src/icp/tactical-runabout.scad

stl/icp/science.stl: src/icp/science.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/science.stl \
	    src/icp/science.scad

images/icp/science.png: stl/icp/science.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/science.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme Metallic \
	    src/icp/science.scad

stl/icp/scout.stl: src/icp/scout.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/icp/scout.stl \
	    src/icp/scout.scad

images/icp/scout.png: stl/icp/scout.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/icp/scout.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow Night" \
	    src/icp/scout.scad

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
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/pod.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "BeforeDawn" \
	    src/macs/shuttlepod.scad

stl/macs/shuttle.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/shuttle.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/shuttle.stl \
	    src/macs/shuttle.scad

images/macs/shuttle.png: stl/macs/shuttle.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/shuttle.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "BeforeDawn" \
	    src/macs/shuttle.scad

stl/macs/small-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/runabout.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/small-runabout.stl \
	    src/macs/runabout.scad

images/macs/small-runabout.png: stl/macs/small-runabout.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/small-runabout.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "BeforeDawn" \
	    src/macs/runabout.scad

stl/macs/cutter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/cutter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/cutter.stl \
	    src/macs/cutter.scad

images/macs/cutter.png: stl/macs/cutter.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/cutter.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "BeforeDawn" \
	    src/macs/cutter.scad

stl/macs/heavy-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/heavy.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/heavy-runabout.stl \
	    src/macs/heavy.scad

images/macs/heavy-runabout.png: stl/macs/heavy-runabout.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/heavy-runabout.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "BeforeDawn" \
	    src/macs/heavy.scad

stl/macs/hospital.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/hospital.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/hospital.stl \
	    src/macs/hospital.scad

images/macs/hospital.png: stl/macs/hospital.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/hospital.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Metallic" \
	    src/macs/hospital.scad

stl/macs/freighter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/freighter.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/macs/freighter.stl \
	    src/macs/freighter.scad

images/macs/freighter.png: stl/macs/freighter.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/macs/freighter.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Nature" \
	    src/macs/freighter.scad

miscstls: stl/misc/cruiser.stl \
    stl/misc/cruiser2.stl

miscimgs: images/misc/cruiser.png \
    images/misc/cruiser2.png

stl/misc/cruiser.stl: src/lib/util.scad src/misc/cruiser.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/misc/cruiser.stl \
	    src/misc/cruiser.scad

images/misc/cruiser.png: stl/misc/cruiser.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/misc/cruiser.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "DeepOcean" \
	    src/misc/cruiser.scad

stl/misc/cruiser2.stl: src/lib/util.scad src/misc/cruiser2.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/misc/cruiser2.stl \
	    src/misc/cruiser2.scad

images/misc/cruiser2.png: stl/misc/cruiser2.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/misc/cruiser2.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Cornfield" \
	    src/misc/cruiser2.scad


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
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/scout.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/scout.scad


stl/mother/transwarp.stl: src/lib/util.scad src src/mother/transwarp.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/transwarp.stl \
	    src/mother/transwarp.scad

images/mothership/transwarp.png: stl/mother/transwarp.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/transwarp.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/transwarp.scad

stl/mother/hangar.stl: src/lib/util.scad src src/mother/hangar.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/hangar.stl \
	    src/mother/hangar.scad

images/mothership/hangar.png: stl/mother/hangar.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/hangar.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/hangar.scad

stl/mother/saucer.stl: src/lib/util.scad src src/mother/saucer.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/saucer.stl \
	    src/mother/saucer.scad

images/mothership/saucer.png: stl/mother/saucer.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/saucer.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/saucer.scad

stl/mother/escort.stl: src/lib/util.scad src src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/escort.stl \
	    src/mother/escort.scad

images/mothership/escort.png: stl/mother/escort.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/escort.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/escort.scad

stl/mother/main.stl: src/lib/util.scad src src/mother/main.scad\
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/main.stl \
	    src/mother/main.scad

images/mothership/main.png: stl/mother/main.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/main.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/main.scad

stl/mother/separation.stl: src/lib/util.scad src \
    src/mother/separation.scad \
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/separation.stl \
	    src/mother/separation.scad

images/mothership/separation.png: stl/mother/separation.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/separation.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/separation.scad

stl/mother/normal-separation.stl: src/lib/util.scad src \
    src/mother/normal-separation.scad \
    src/mother/scout.scad src/mother/saucer.scad \
    src/mother/hangar.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/normal-separation.stl \
	    src/mother/normal-separation.scad

images/mothership/normal-separation.png: stl/mother/normal-separation.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/normal-separation.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/normal-separation.scad

stl/mother/starbase.stl: src/lib/util.scad src src/mother/starbase.scad \
    src/mother/saucer.scad src/mother/hangar.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/starbase.stl \
	    src/mother/starbase.scad

images/mothership/starbase.png: stl/mother/starbase.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/starbase.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/starbase.scad

stl/mother/starship.stl: src/lib/util.scad src src/mother/starship.scad \
    src/mother/scout.scad src/mother/transwarp.scad \
    src/mother/escort.scad
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o stl/mother/starship.stl \
	    src/mother/starship.scad

images/mothership/starship.png: stl/mother/starship.stl
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/mothership/starship.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/mother/starship.scad

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
	/usr/bin/flatpak run org.openscad.OpenSCAD/x86_64/stable \
	    -o images/combined/scale.png \
	    --autocenter \
	    --viewall \
	    --imgsize 3840,2160 \
	    --render \
	    --projection p \
	    --colorscheme "Tomorrow" \
	    src/combined/scale.scad

