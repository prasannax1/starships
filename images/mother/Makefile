IMG += escort.png 
IMG += scout.png 
IMG += command.png 
IMG += saucer.png 
IMG += labs.png 
IMG += scout_full.png 
IMG += scout_simple.png 
IMG += scout_alt.png 
IMG += command_full.png 
IMG += command_alt.png 
IMG += command_simple.png 
IMG += saucer_full.png 
IMG += labs_full.png 
IMG += labs_alt.png 
IMG += carrier.png 
IMG += main.png 
IMG += warp.png

all: $(IMG)

$(IMG):
	bash ../../bin/render.sh \
	    -i ../../src/unified/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Sunset \

escort.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/escort.scad


scout.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/scout.scad


command.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/command.scad


labs.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/labs.scad

scout_full.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/scout_full.scad
	
scout_simple.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/scout_simple.scad

scout_alt.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/scout_alt.scad

command_full.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/command_full.scad 

command_alt.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/command_alt.scad

command_simple.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/command_simple.scad
	
labs_full.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/labs_full.scad

labs_alt.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/labs_alt.scad

saucer.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/saucer.scad

saucer_full.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/saucer_full.scad

carrier.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/carrier.scad

warp.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
    ../../src/unified/warp.scad

main.png: ../../src/lib/util.scad ../../src/unified/common.scad  \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/warp.scad ../../src/unified/escort.scad \
	../../src/unified/main.scad

