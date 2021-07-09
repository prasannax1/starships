STL += saucer.stl
STL += transwarp.stl 
STL += escort.stl 
STL += scout.stl 
STL += command.stl 
STL += carrier.stl 
STL += main.stl 

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -o $@

saucer.stl: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/saucer_lib.scad \
    ../../src/mother/saucer.scad

transwarp.stl: ../../src/lib/util.scad ../../src/mother/transwarp_lib.scad ../../src/mother/global.scad \
    ../../src/mother/transwarp.scad

escort.stl: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/escort_lib.scad \
    ../../src/mother/escort.scad

scout.stl: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/scout_lib.scad \
    ../../src/mother/scout.scad

command.stl: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/command_lib.scad \
    ../../src/mother/command.scad

carrier.stl: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/carrier_lib.scad \
    ../../src/mother/carrier.scad

main.stl: \
    saucer.stl \
    transwarp.stl \
    escort.stl \
    scout.stl \
    command.stl \
    carrier.stl \
    ../../src/mother/main.scad

