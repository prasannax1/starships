STL += command-shuttles.stl
STL += scout-shuttles.stl 
STL += escort-shuttles.stl 
STL += icp-shuttles.stl 
STL += mother-ships.stl 

all: $(STL)

$(STL):
	../../bin/render.sh \
	    -i ../../src/combined/$(basename $(notdir $@)).scad \
	    -o $@

just-ships.stl: ../../src/combined/just-ships.scad \
    ../../src/combined/command-shuttles.scad \
    ../../src/combined/scout-shuttles.scad \
    ../../src/combined/escort-shuttles.scad \
    ../../src/combined/saucer-ships.scad \
    ../../src/combined/transwarp-ships.scad

mother-ships.stl: ../../src/combined/mother-ships.scad \
    ../../src/mother/mlib.scad \
    ../../src/combined/command-shuttles.scad \
    ../../src/combined/scout-shuttles.scad \
    ../../src/combined/escort-shuttles.scad \
    ../../src/combined/saucer-ships.scad \
    ../../src/combined/transwarp-ships.scad

command-shuttles.stl: ../../src/combined/command-shuttles.scad \
    ../../src/lib/util.scad \
    ../../src/mother/mlib.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad \
    ../../src/macs/fighter.scad

scout-shuttles.stl: ../../src/combined/scout-shuttles.scad \
    ../../src/lib/util.scad \
    ../../src/mother/mlib.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad 

escort-shuttles.stl: ../../src/combined/escort-shuttles.scad \
    ../../src/lib/util.scad \
    ../../src/mother/mlib.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad \
    ../../src/macs/fighter.scad \
    ../../src/icp/tactical-runabout.scad

saucer-ships.stl: ../../src/combined/saucer-ships.scad \
    ../../src/lib/util.scad \
    ../../src/mother/mlib.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad \
    ../../src/icp/runabout.scad \
    ../../src/icp/tactical-runabout.scad \
    ../../src/icp/science.scad \
    ../../src/icp/explorer.scad \
    ../../src/icp/yacht.scad \
    ../../src/icp/diplomat.scad

icp-shuttles.stl: ../../src/combined/icp-shuttles.scad \
    ../../src/lib/util.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad \
    ../../src/icp/runabout.scad \
    ../../src/icp/tactical-runabout.scad \
    ../../src/icp/science.scad \
    ../../src/icp/explorer.scad \
    ../../src/icp/yacht.scad \
    ../../src/icp/diplomat.scad

transwarp-ships.stl: ../../src/combined/transwarp-ships.scad \
    ../../src/lib/util.scad \
    ../../src/mother/mlib.scad \
    ../../src/macs/macs.scad \
    ../../src/combined/multilib.scad \
    ../../src/macs/fighter.scad \
    ../../src/icp/attack.scad \
    ../../src/icp/tactical-runabout.scad


