IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += main.png 
IMG += saucer-full.png 
IMG += carrier-full.png
IMG += transwarp-full.png 
IMG += half-separation.png 
IMG += full-separation.png
IMG += no-saucer.png
IMG += no-carrier.png
IMG += no-transwarp.png

all: $(IMG)

$(IMG):
	../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Tomorrow

escort.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/escort.scad

scout.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/scout.scad

command.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/command.scad

main.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/main.scad

saucer-full.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/saucer-full.scad

carrier-full.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/carrier-full.scad

transwarp-full.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/transwarp-full.scad

half-separation.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/half-separation.scad

full-separation.png: ../../src/lib/util.scad ../../src/mother/mlib.scad \
    ../../src/mother/full-separation.scad

