all: stls 

stls: icpstls macstls motherstls combinestls miscstls

icpstls: stl/icp/attack.stl \
    stl/icp/diplomat.stl \
    stl/icp/runabout.stl \
    stl/icp/tactical-shuttle.stl \
    stl/icp/science.stl \
    stl/icp/scout.stl 

stl/icp/attack.stl: src/icp/attack.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/attack.scad \
	    -o stl/icp/attack.stl \
	    -p images/icp/attack.png \
	    -t Sunset

stl/icp/diplomat.stl: src/icp/diplomatic.scad src/lib/util.scad
	bin/render.sh \
	    -i src/icp/diplomatic.scad \
	    -o stl/icp/diplomat.stl \
	    -p images/icp/diplomat.png \
	    -t Tomorrow

stl/icp/runabout.stl: src/icp/runabout.scad src/lib/util.scad
	bin/render.sh \
	    -i src/icp/runabout.scad \
	    -o stl/icp/runabout.stl \
	    -p images/icp/runabout.png \
	    -t Tomorrow

stl/icp/tactical-shuttle.stl: src/icp/tactical-runabout.scad \
    src/lib/util.scad
	bin/render.sh \
	    -i src/icp/tactical-runabout.scad \
	    -o stl/icp/tactical-shuttle.stl \
	    -p images/icp/tactical-shutle.png \
	    -t Solarized

stl/icp/science.stl: src/icp/science.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/science.scad \
	    -o stl/icp/science.stl \
	    -p images/icp/science.png \
	    -t Metallic

stl/icp/scout.stl: src/icp/scout.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/scout.scad \
	    -o stl/icp/scout.stl \
	    -p images/icp/scout.png \
	    -t "Tomorrow Night"

macstls: stl/macs/shuttlepod.stl \
    stl/macs/shuttle.stl \
    stl/macs/small-runabout.stl \
    stl/macs/cutter.stl \
    stl/macs/heavy-runabout.stl \
    stl/macs/hospital.stl \
    stl/macs/freighter.stl

stl/macs/shuttlepod.stl: src/macs/macs.scad src/macs/shuttlepod.scad \
    src/lib/util.scad
	bin/render.sh \
	    -i src/macs/shuttlepod.scad \
	    -o stl/macs/shuttlepod.stl \
	    -p images/macs/pod.png \
	    -t BeforeDawn

stl/macs/shuttle.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/shuttle.scad
	bin/render.sh \
	    -i src/macs/shuttle.scad \
	    -o stl/macs/shuttle.stl \
	    -p images/macs/shuttle.png \
	    -t BeforeDawn

stl/macs/small-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/runabout.scad
	bin/render.sh \
	    -i src/macs/runabout.scad \
	    -o stl/macs/small-runabout.stl \
	    -p images/macs/small-runabout.png \
	    -t BeforeDawn

stl/macs/cutter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/cutter.scad
	bin/render.sh \
	    -i src/macs/cutter.scad \
	    -o stl/macs/cutter.stl \
	    -p images/macs/cutter.png \
	    -t BeforeDawn

stl/macs/heavy-runabout.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/heavy.scad
	bin/render.sh \
	    -i src/macs/heavy.scad \
	    -o stl/macs/heavy-runabout.stl \
	    -p images/macs/heavy-runabout.png \
	    -t BeforeDawn

stl/macs/hospital.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/hospital.scad
	bin/render.sh \
	    -i src/macs/hospital.scad \
	    -o stl/macs/hospital.stl \
	    -p images/macs/hospital.png \
	    -t Metallic

stl/macs/freighter.stl: src/macs/macs.scad src/lib/util.scad \
    src/macs/freighter.scad
	bin/render.sh \
	    -i src/macs/freighter.scad \
	    -o stl/macs/freighter.stl \
	    -p images/macs/freighter.png \
	    -t Nature

miscstls: stl/misc/cruiser.stl \
    stl/misc/cruiser2.stl \
    stl/misc/cruiser3.stl


stl/misc/cruiser.stl: src/lib/util.scad src/misc/cruiser.scad
	bin/render.sh \
	    -i src/misc/cruiser.scad \
	    -o stl/misc/cruiser.stl \
	    -p images/misc/cruiser.png \
	    -t DeepOcean

stl/misc/cruiser2.stl: src/lib/util.scad src/misc/cruiser2.scad
	bin/render.sh \
	    -i src/misc/cruiser2.scad \
	    -o stl/misc/cruiser2.stl \
	    -p images/misc/cruiser2.png \
	    -t Cornfield

stl/misc/cruiser3.stl: src/lib/util.scad src/misc/cruiser3.scad
	bin/render.sh \
	    -i src/misc/cruiser3.scad \
	    -o stl/misc/cruiser3.stl \
	    -p images/misc/cruiser3.png \
	    -t Solarized


motherstls: stl/mother/saucer.stl \
    stl/mother/transwarp.stl \
    stl/mother/escort.stl \
    stl/mother/main.stl \
    stl/mother/separation.stl \
    stl/mother/normal-separation.stl 

stl/mother/transwarp.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/transwarp.scad
	bin/render.sh \
	    -i src/mother/transwarp.scad \
	    -o stl/mother/transwarp.stl \
	    -p images/mothership/transwarp.png \
	    -t Tomorrow

stl/mother/saucer.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/saucer.scad
	bin/render.sh \
	    -i src/mother/saucer.scad \
	    -o stl/mother/saucer.stl \
	    -p images/mothership/saucer.png \
	    -t Tomorrow

stl/mother/escort.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/escort.scad
	bin/render.sh \
	    -i src/mother/escort.scad \
	    -o stl/mother/escort.stl \
	    -p images/mothership/escort.png \
	    -t Tomorrow

stl/mother/main.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/main.scad\
    src/mother/saucer.scad \
    src/mother/transwarp.scad \
    src/mother/escort.scad
	bin/render.sh \
	    -i src/mother/main.scad \
	    -o stl/mother/main.stl \
	    -p images/mothership/main.png \
	    -t Tomorrow

stl/mother/separation.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/separation.scad \
    src/mother/saucer.scad \
    src/mother/transwarp.scad \
    src/mother/escort.scad
	bin/render.sh \
	    -i src/mother/separation.scad \
	    -o stl/mother/separation.stl \
	    -p images/mothership/separation.png \
	    -t Tomorrow

stl/mother/normal-separation.stl: src/lib/util.scad \
    src/mother/common.scad \
    src/mother/normal-separation.scad \
    src/mother/saucer.scad \
    src/mother/transwarp.scad \
    src/mother/escort.scad
	bin/render.sh \
	    -i src/mother/normal-separation.scad \
	    -o stl/mother/normal-separation.stl \
	    -p images/mothership/normal-separation.png \
	    -t Tomorrow

combinestls: stl/combined/scale.stl

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
    src/icp/diplomatic.scad \
    src/icp/attack.scad \
    src/icp/tactical-runabout.scad \
    src/macs/hospital.scad \
    src/combined/color.scad \
    src/combined/scale.scad
	bin/render.sh \
	    -i src/combined/scale.scad \
	    -o stl/combined/scale.stl \
	    -p images/combined/scale.png \
	    -t BeforeDawn

