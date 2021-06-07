IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += main.png 
IMG += saucer-full.png 
IMG += carrier-full.png
IMG += transwarp-full.png 
IMG += half-separation.png 
IMG += full-separation.png
IMG += transwarp-separation.png
IMG += saucer-separation.png
IMG += carrier-separation.png
IMG += no-saucer.png
IMG += no-transwarp.png

all: $(IMG)

$(IMG):
	../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Tomorrow \
	    -c "-382.1,9.81,23.48,98.4,0,339,4078"

escort.png: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/escort_lib.scad \
    ../../src/mother/escort.scad
	../../bin/render.sh \
	    -i ../../src/mother/escort.scad \
	    -p escort.png \
	    -t Tomorrow 


scout.png: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/scout_lib.scad \
    ../../src/mother/scout.scad
	../../bin/render.sh \
	    -i ../../src/mother/scout.scad \
	    -p scout.png \
	    -t Tomorrow 


command.png: ../../src/lib/util.scad ../../src/mother/global.scad ../../src/mother/command_lib.scad \
    ../../src/mother/command.scad
	../../bin/render.sh \
	    -i ../../src/mother/command.scad \
	    -p command.png \
	    -t Tomorrow 


main.png: \
    ../../src/mother/command.scad \
    ../../src/mother/transwarp.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/main.scad

saucer-full.png: ../../src/mother/saucer.scad ../../src/mother/scout.scad \
    ../../src/mother/saucer-full.scad
	../../bin/render.sh 


carrier-full.png: ../../src/mother/carrier.scad ../../src/mother/escort.scad \
    ../../src/mother/carrier-full.scad
	../../bin/render.sh 

transwarp-full.png: ../../src/mother/transwarp.scad ../../src/mother/command.scad \
    ../../src/mother/transwarp-full.scad
	../../bin/render.sh \
	    -i ../../src/mother/transwarp-full.scad \
	    -p transwarp-full.png \
	    -t Tomorrow 


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

carrier-separation.png: ../../src/mother/carrier.scad ../../src/mother/escort.scad \
    ../../src/mother/carrier-separation.scad

saucer-separation.png: ../../src/mother/saucer.scad ../../src/mother/scout.scad \
    ../../src/mother/saucer-separation.scad

transwarp-separation.png: ../../src/mother/transwarp.scad ../../src/mother/command.scad \
    ../../src/mother/transwarp-separation.scad

