STL += saucer.stl
STL += transwarp.stl 
STL += escort.stl 
STL += scout.stl 
STL += command.stl 
STL += carrier.stl 
STL += warp.stl 
STL += main.stl 

all: $(STL)

$(STL):
	bash ../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -o $@

saucer.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad

warp.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/warp.scad

transwarp.stl: ../../src/lib/util.scad  ../../src/mother/common.scad \
    ../../src/mother/transwarp.scad

escort.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/escort.scad

scout.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad

command.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad

carrier.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/carrier.scad

main.stl: \
    saucer.stl \
    transwarp.stl \
    escort.stl \
    scout.stl \
    command.stl \
    carrier.stl \
    warp.stl \
    ../../src/mother/main.scad

