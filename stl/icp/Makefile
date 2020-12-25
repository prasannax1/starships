STL += attack.stl 
STL += diplomat.stl 
STL += runabout.stl 
STL += tactical-runabout.stl 
STL += science.stl 
STL += explorer.stl 
STL += destroyer.stl 
STL += diplomat.stl 
STL += long-yacht.stl 
STL += observer.stl 
STL += yacht.stl 

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/icp/$(basename $(notdir $@)).scad \
	    -o $@

attack.stl: ../../src/icp/attack.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad

explorer.stl: ../../src/icp/explorer.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad

observer.stl: ../../src/icp/observer.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad

destroyer.stl: ../../src/icp/destroyer.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad

yacht.stl: ../../src/icp/yacht.scad ../../src/lib/util.scad 

long-yacht.stl: ../../src/icp/long-yacht.scad ../../src/lib/util.scad 

runabout.stl: ../../src/icp/runabout.scad ../../src/lib/util.scad

tactical-runabout.stl: ../../src/icp/tactical-runabout.scad \
    ../../src/lib/util.scad

science.stl: ../../src/icp/science.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad

diplomat.stl: ../../src/icp/diplomat.scad \
    ../../src/lib/util.scad \
    ../../src/icp/icp.scad


