all: stls 

stls: icpstls macstls motherstls combinestls miscstls

icpstls: stl/icp/attack.stl \
    stl/icp/diplomat.stl \
    stl/icp/runabout.stl \
    stl/icp/tactical-shuttle.stl \
    stl/icp/science.stl \
    stl/icp/explorer.stl \
    stl/icp/destroyer.stl \
    stl/icp/diplomat.stl 

stl/icp/attack.stl: src/icp/attack.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/attack.scad \
	    -o stl/icp/attack.stl \
	    -p images/icp/attack.png \
	    -t Sunset

stl/icp/explorer.stl: src/icp/explorer.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/explorer.scad \
	    -o stl/icp/explorer.stl \
	    -p images/icp/explorer.png \
	    -t Tomorrow

stl/icp/destroyer.stl: src/icp/destroyer.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/destroyer.scad \
	    -o stl/icp/destroyer.stl \
	    -p images/icp/destroyer.png \
	    -t Sunset

stl/icp/yacht.stl: src/icp/yacht.scad src/lib/util.scad
	bin/render.sh \
	    -i src/icp/yacht.scad \
	    -o stl/icp/yacht.stl \
	    -p images/icp/yacht.png \
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
	    -p images/icp/tactical-shuttle.png \
	    -t Solarized

stl/icp/science.stl: src/icp/science.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/science.scad \
	    -o stl/icp/science.stl \
	    -p images/icp/science.png \
	    -t Nature

stl/icp/diplomat.stl: src/icp/diplomat.scad \
    src/lib/util.scad \
    src/icp/icp.scad
	bin/render.sh \
	    -i src/icp/diplomat.scad \
	    -o stl/icp/diplomat.stl \
	    -p images/icp/diplomat.png \
	    -t Metallic

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
	    -c "20.53,42.62,5.09,88.6,0,132.4,343" \
	    -t Cornfield

stl/misc/cruiser3.stl: src/lib/util.scad src/misc/cruiser3.scad
	bin/render.sh \
	    -i src/misc/cruiser3.scad \
	    -o stl/misc/cruiser3.stl \
	    -p images/misc/cruiser3.png \
	    -c "-62.29,0.15,-2.5,98.4,0,221,564" \
	    -t Solarized


motherstls: stl/mother/saucer.stl \
    stl/mother/transwarp.stl \
    stl/mother/escort.stl \
    stl/mother/scout.stl \
    stl/mother/command.stl \
    stl/mother/main.stl \
    stl/mother/transwarp-full.stl \
    stl/mother/transwarp-escort.stl \
    stl/mother/battle-separation.stl \
    stl/mother/scout-separation.stl \
    stl/mother/command-separation.stl \
    stl/mother/escort-separation.stl \
    stl/mother/full-separation.stl \
    stl/mother/normal-separation.stl 

stl/mother/transwarp.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/transwarp.scad
	bin/render.sh \
	    -i src/mother/transwarp.scad \
	    -o stl/mother/transwarp.stl \
	    -p images/mothership/transwarp.png \
	    -t Tomorrow

stl/mother/escort-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/escort-separation.scad
	bin/render.sh \
	    -i src/mother/escort-separation.scad \
	    -o stl/mother/escort-separation.stl \
	    -p images/mothership/escort-separation.png \
	    -c "-358.8,0,90.55,90,0,0,2688" \
	    -t Tomorrow

stl/mother/transwarp-full.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/transwarp-full.scad
	bin/render.sh \
	    -i src/mother/transwarp-full.scad \
	    -o stl/mother/transwarp-full.stl \
	    -p images/mothership/transwarp-full.png \
	    -t Tomorrow

stl/mother/transwarp-escort.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/transwarp-escort.scad
	bin/render.sh \
	    -i src/mother/transwarp-escort.scad \
	    -o stl/mother/transwarp-escort.stl \
	    -p images/mothership/transwarp-escort.png \
	    -c "-582.31,11,-1.57,151.6,0,37.6,1914" \
	    -t Tomorrow

stl/mother/scout.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/scout.scad
	bin/render.sh \
	    -i src/mother/scout.scad \
	    -o stl/mother/scout.stl \
	    -p images/mothership/scout.png \
	    -t Tomorrow

stl/mother/command.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/command.scad
	bin/render.sh \
	    -i src/mother/command.scad \
	    -o stl/mother/command.stl \
	    -p images/mothership/command.png \
	    -t Tomorrow

stl/mother/battle-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/battle-separation.scad
	bin/render.sh \
	    -i src/mother/battle-separation.scad \
	    -o stl/mother/battle-separation.stl \
	    -p images/mothership/battle-separation.png \
	    -c "-358.8,0,40.55,90,0,0,3336" \
	    -t Tomorrow

stl/mother/scout-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/scout-separation.scad
	bin/render.sh \
	    -i src/mother/scout-separation.scad \
	    -o stl/mother/scout-separation.stl \
	    -p images/mothership/scout-separation.png \
	    -c "-368.39,-2.92,1.55,95.6,0,209.10,2468" \
	    -t Tomorrow

stl/mother/command-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/command-separation.scad
	bin/render.sh \
	    -i src/mother/command-separation.scad \
	    -o stl/mother/command-separation.stl \
	    -p images/mothership/command-separation.png \
	    -c "-358.8,0,90.55,90,0,0,2688" \
	    -t Tomorrow

stl/mother/saucer.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/saucer.scad
	bin/render.sh \
	    -i src/mother/saucer.scad \
	    -o stl/mother/saucer.stl \
	    -p images/mothership/saucer.png \
	    -t Tomorrow

stl/mother/escort.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/escort.scad
	bin/render.sh \
	    -i src/mother/escort.scad \
	    -o stl/mother/escort.stl \
	    -p images/mothership/escort.png \
	    -c "-44.88,0.94,-0.33,132.7,0,43.2,500" \
	    -t Tomorrow

stl/mother/main.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/main.scad
	bin/render.sh \
	    -i src/mother/main.scad \
	    -o stl/mother/main.stl \
	    -p images/mothership/main.png \
	    -t Tomorrow

stl/mother/full-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/full-separation.scad
	bin/render.sh \
	    -i src/mother/full-separation.scad \
	    -o stl/mother/full-separation.stl \
	    -p images/mothership/full-separation.png \
	    -c "-35.83,29.84,58.27,90,0,0,4000" \
	    -t Tomorrow

stl/mother/normal-separation.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    src/mother/normal-separation.scad 
	bin/render.sh \
	    -i src/mother/normal-separation.scad \
	    -o stl/mother/normal-separation.stl \
	    -p images/mothership/normal-separation.png \
	    -c "-358.8,0,74.22,90,0,0,3383" \
	    -t Tomorrow

combinestls: stl/combined/scale.stl

stl/combined/scale.stl: src/lib/util.scad \
    src/mother/mlib.scad \
    stl/mother/full-separation.stl \
    src/macs/macs.scad \
    src/macs/shuttle.scad \
    src/macs/runabout.scad \
    src/macs/cutter.scad \
    src/macs/heavy.scad \
    src/icp/runabout.scad \
    src/icp/science.scad \
    src/icp/yacht.scad \
    src/icp/attack.scad \
    src/icp/tactical-runabout.scad \
    src/macs/hospital.scad \
    src/combined/color.scad \
    src/combined/scale.scad
	bin/render.sh \
	    -i src/combined/scale.scad \
	    -o stl/combined/scale.stl \
	    -p images/combined/scale.png \
	    -s 5760,2160 \
	    -c "-358.8,0,143.5,90,0,0,3816" \
	    -t BeforeDawn


