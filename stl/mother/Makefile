STL += saucer.stl
STL += transwarp.stl 
STL += escort.stl 
STL += scout.stl 
STL += command.stl 
STL += carrier.stl 
STL += main.stl 
STL += saucer-full.stl 
STL += carrier-full.stl
STL += transwarp-full.stl 
STL += half-separation.stl 
STL += full-separation.stl

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

saucer-full.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/saucer-full.scad

carrier-full.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/carrier-full.scad

transwarp-full.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/transwarp-full.scad

half-separation.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/half-separation.scad

full-separation.stl: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/full-separation.scad

