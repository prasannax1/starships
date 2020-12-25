STL += shuttlepod.stl 
STL += shuttle.stl 
STL += small-runabout.stl 
STL += cutter.stl 
STL += heavy-runabout.stl 
STL += hospital.stl 
STL += small-pod.stl 
STL += fighter.stl 
STL += tactical-runabout.stl 
STL += freighter.stl

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/macs/$(basename $(notdir $@)).scad \
	    -o $@

fighter.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/fighter.scad

small-pod.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/small-pod.scad

tactical-runabout.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/tactical-runabout.scad

shuttlepod.stl: ../../src/macs/macs.scad ../../src/macs/shuttlepod.scad \
    ../../src/lib/util.scad

shuttle.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/shuttle.scad

small-runabout.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/small-runabout.scad

cutter.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/cutter.scad

heavy-runabout.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/heavy-runabout.scad

hospital.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/hospital.scad

freighter.stl: ../../src/macs/macs.scad ../../src/lib/util.scad \
    ../../src/macs/freighter.scad


