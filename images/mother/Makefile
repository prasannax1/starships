IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += saucer.png 
IMG += labs.png 
IMG += scout_full.png 
IMG += scout_simple.png 
IMG += scout_engine.png 
IMG += command_full.png 
IMG += command_engine.png 
IMG += command_medium.png 
IMG += command_simple.png 
IMG += saucer_full.png 
IMG += labs_full.png 
IMG += labs_medium.png 
IMG += carrier.png 
IMG += main.png 
IMG += warp.png

all: $(IMG)

$(IMG):
	bash ../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Tomorrow \

escort.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/escort.scad


scout.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad


command.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad


labs.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad

scout_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_full.scad \
	../../src/mother/scout_engine.scad ../../src/mother/scout_secondary.scad

scout_engine.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_engine.scad
	
scout_simple.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_simple.scad \
	../../src/mother/scout_engine.scad

command_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_full.scad \
	../../src/mother/command_engine.scad ../../src/mother/command_secondary.scad

command_medium.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_medium.scad \
	../../src/mother/scout_engine.scad

command_simple.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_simple.scad \
	../../src/mother/command_engine.scad

command_engine.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_engine.scad
	
labs_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad ../../src/mother/labs_full.scad

labs_medium.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad ../../src/mother/labs_medium.scad \
	../../src/mother/command_engine.scad

saucer.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad

saucer_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad ../../src/mother/saucer_full.scad

carrier.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/carrier.scad

warp.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/warp.scad

main.png: \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/main.scad


