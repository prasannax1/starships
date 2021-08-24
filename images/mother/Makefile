IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += saucer.png 
IMG += transwarp.png 
IMG += carrier.png 
IMG += main.png 
IMG += half-separation.png 
IMG += full-separation.png

all: $(IMG)

$(IMG):
	../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Tomorrow \
	    -c "-382.1,9.81,23.48,98.4,0,339,4078"

escort.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/escort.scad
	../../bin/render.sh \
	    -i ../../src/mother/escort.scad \
	    -p escort.png \
	    -t Tomorrow 


scout.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad
	../../bin/render.sh \
	    -i ../../src/mother/scout.scad \
	    -p scout.png \
	    -t Tomorrow 


command.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad
	../../bin/render.sh \
	    -i ../../src/mother/command.scad \
	    -p command.png \
	    -t Tomorrow 


transwarp.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/transwarp.scad
	../../bin/render.sh \
	    -i ../../src/mother/transwarp.scad \
	    -p transwarp.png \
	    -t Tomorrow 

saucer.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad
	../../bin/render.sh \
	    -i ../../src/mother/saucer.scad \
	    -p saucer.png \
	    -t Tomorrow 

carrier.png: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/carrier.scad
	../../bin/render.sh \
	    -i ../../src/mother/carrier.scad \
	    -p carrier.png \
	    -t Tomorrow 

main.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/main.scad

half-separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/half-separation.scad

full-separation.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/full-separation.scad

