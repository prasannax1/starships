
icp: attack.png \
    diplomat.png \
    runabout.png \
    tactical-runabout.png \
    science.png \
    explorer.png \
    diplomat.png \
    observer.png \
    yacht.png 

attack.png: ../../src/icp/attack.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad
	../../bin/render.sh \
	    -i ../../src/icp/attack.scad \
	    -p attack.png \
	    -c "-17.27,0,0,42.4,0,308,279" \
	    -t Sunset

explorer.png: ../../src/icp/explorer.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad
	../../bin/render.sh \
	    -i ../../src/icp/explorer.scad \
	    -p explorer.png \
	    -t Tomorrow

observer.png: ../../src/icp/observer.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad
	../../bin/render.sh \
	    -i ../../src/icp/observer.scad \
	    -p observer.png \
	    -t "Tomorrow Night"

yacht.png: ../../src/icp/yacht.scad ../../src/lib/util.scad 
	../../bin/render.sh \
	    -i ../../src/icp/yacht.scad \
	    -p yacht.png \
	    -t Starnight

runabout.png: ../../src/icp/runabout.scad ../../src/lib/util.scad
	../../bin/render.sh \
	    -i ../../src/icp/runabout.scad \
	    -p runabout.png \
	    -t Tomorrow

tactical-runabout.png: ../../src/icp/tactical-runabout.scad \
    ../../src/lib/util.scad
	../../bin/render.sh \
	    -i ../../src/icp/tactical-runabout.scad \
	    -p tactical-runabout.png \
	    -t Solarized

science.png: ../../src/icp/science.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad
	../../bin/render.sh \
	    -i ../../src/icp/science.scad \
	    -p science.png \
	    -t Nature

diplomat.png: ../../src/icp/diplomat.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad
	../../bin/render.sh \
	    -i ../../src/icp/diplomat.scad \
	    -p diplomat.png \
	    -t Metallic
