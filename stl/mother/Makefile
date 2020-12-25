STL += saucer.stl
STL += transwarp.stl 
STL += escort.stl 
STL += scout.stl 
STL += command.stl 
STL += carrier.stl 
STL += main.stl 
STL += no-saucer.stl 
STL += no-transwarp.stl 

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -o $@

saucer.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/saucer.scad

transwarp.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/transwarp.scad

escort.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/escort.scad

scout.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/scout.scad

command.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/command.scad

carrier.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/carrier.scad

main.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/main.scad

no-saucer.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/no-saucer.scad

no-transwarp.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/no-transwarp.scad

