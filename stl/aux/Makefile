STL += attack-primary.stl
STL += attack.stl
STL += attack-secondary.stl
STL += diplomat.stl
STL += fighter.stl
STL += heavy-runabout.stl
STL += runabout.stl
STL += science.stl
STL += shuttle-large.stl
STL += shuttle-medium.stl
STL += shuttlepod.stl
STL += shuttle-small.stl
STL += tactical-runabout.stl

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/aux/$(basename $(notdir $@)).scad \
	    -o $@

attack-primary.stl: ../../src/lib/util.scad ../../src/aux/attack-primary.scad

attack.stl: attack-primary.stl attack-secondary.stl

attack-secondary.stl: ../../src/lib/util.scad ../../src/aux/attack-secondary.scad

diplomat.stl: ../../src/lib/util.scad ../../src/aux/diplomat.scad

fighter.stl: ../../src/lib/util.scad ../../src/aux/fighter.scad

heavy-runabout.stl: ../../src/lib/util.scad ../../src/aux/heavy-runabout.scad

runabout.stl: ../../src/lib/util.scad ../../src/aux/runabout.scad

science.stl: ../../src/lib/util.scad ../../src/aux/science.scad

shuttle-large.stl: ../../src/lib/util.scad ../../src/aux/shuttle-large.scad

shuttle-medium.stl: ../../src/lib/util.scad ../../src/aux/shuttle-medium.scad

shuttlepod.stl: ../../src/lib/util.scad ../../src/aux/shuttlepod.scad

shuttle-small.stl: ../../src/lib/util.scad ../../src/aux/shuttle-small.scad

tactical-runabout.stl: ../../src/lib/util.scad ../../src/aux/tactical-runabout.scad


