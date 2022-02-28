IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += saucer.png 
IMG += transwarp.png 
IMG += carrier.png 
IMG += main.png 
IMG += half-separation.png 
IMG += full-separation.png
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


transwarp.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/transwarp.scad

saucer.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad

carrier.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/carrier.scad

warp.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/warp.scad

main.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/main.scad

half-separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/half-separation.scad

full-separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/full-separation.scad

