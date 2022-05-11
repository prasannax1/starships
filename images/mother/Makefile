IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += saucer.png 
IMG += labs.png 
IMG += scout_full.png 
IMG += command_full.png 
IMG += saucer_full.png 
IMG += labs_full.png 
IMG += carrier.png 
IMG += main.png 
IMG += half_separation.png 
IMG += full_separation.png
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
    ../../src/mother/scout.scad ../../src/mother/scout_full.scad


command_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_full.scad


labs_full.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad ../../src/mother/labs_full.scad

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

half_separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/half_separation.scad

full_separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/full_separation.scad

