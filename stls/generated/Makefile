unifiedSTL += escort.stl
unifiedSTL += scout.stl
unifiedSTL += command.stl
unifiedSTL += saucer.stl
unifiedSTL += scout_full.stl
unifiedSTL += scout_simple.stl
unifiedSTL += scout_alt.stl
unifiedSTL += command_full.stl
unifiedSTL += command_alt.stl
unifiedSTL += command_simple.stl
unifiedSTL += labs_full.stl
unifiedSTL += labs_alt.stl
unifiedSTL += carrier.stl
unifiedSTL += main.stl
unifiedSTL += main_lowered.stl
unifiedSTL += scale_cruisers.stl
unifiedSTL += scale_small.stl
unifiedSTL += warp.stl
unifiedSTL += attack.stl
unifiedSTL += destroyer.stl
unifiedSTL += diplomat.stl
unifiedSTL += yacht.stl
unifiedSTL += science.stl
unifiedSTL += medevac.stl
unifiedSTL += heavy_runabout.stl

SMALLSTL += fighter.stl
SMALLSTL += runabout.stl
SMALLSTL += shuttle-large.stl
SMALLSTL += shuttle-medium.stl
SMALLSTL += shuttlepod.stl
SMALLSTL += shuttle-small.stl
SMALLSTL += tactical-runabout.stl


all: $(unifiedSTL) $(SMALLSTL) scale_components.stl

$(unifiedSTL):
	bash ../../bin/render.sh \
	    -i ../../src/unified/$(basename $(notdir $@)).scad \
	    -o $@

$(SMALLSTL):
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -o $@

attack.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/attack.scad

destroyer.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/destroyer.scad

diplomat.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/diplomat.scad

scale_cruisers.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/scout_full.scad ../../src/unified/command_full.scad \
	../../src/unified/scale_cruisers.scad

scale_small.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/attack.scad ../../src/unified/diplomat.scad \
	../../src/unified/science.scad ../../src/unified/yacht.scad \
	../../src/unified/scale_small.scad

yacht.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/yacht.scad

fighter.stl: ../../src/lib/util.scad ../../src/small/fighter.scad

heavy_runabout.stl: ../../src/lib/util.scad ../../src/unified/heavy_runabout.scad

runabout.stl: ../../src/lib/util.scad ../../src/small/runabout.scad

science.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/science.scad

medevac.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/medevac.scad

shuttle-large.stl: ../../src/lib/util.scad ../../src/small/shuttle-large.scad

shuttle-medium.stl: ../../src/lib/util.scad ../../src/small/shuttle-medium.scad

shuttlepod.stl: ../../src/lib/util.scad ../../src/small/shuttlepod.scad

shuttle-small.stl: ../../src/lib/util.scad ../../src/small/shuttle-small.scad

tactical-runabout.stl: ../../src/lib/util.scad ../../src/small/tactical-runabout.scad

scale_components.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/command.scad \
    ../../src/unified/labs.scad \
    ../../src/unified/saucer.scad \
    ../../src/unified/carrier.scad \
    ../../src/unified/scout.scad \
    ../../src/unified/escort.scad \
    ../../src/unified/warp.scad \
    ../../src/unified/main.scad \
    ../../src/standard/scale-components-for-stl.scad
	bash ../../bin/render.sh \
	    -i ../../src/standard/scale-components-for-stl.scad \
	    -o $@

escort.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/escort.scad


scout.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/scout.scad


command.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/command.scad

labs.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/labs.scad

scout_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/scout_full.scad

scout_alt.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/scout_alt.scad

scout_simple.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/scout_simple.scad

command_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/command_full.scad

command_alt.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/command_alt.scad

command_simple.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/command_simple.scad

labs_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/labs_full.scad

labs_alt.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/labs_alt.scad

saucer.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/saucer.scad

carrier.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/carrier.scad

warp.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/warp.scad

main.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/warp.scad ../../src/unified/escort.scad \
	../../src/unified/main.scad

main_lowered.stl: ../../src/lib/util.scad ../../src/unified/common.scad \
	../../src/unified/disks.scad ../../src/unified/engines.scad \
	../../src/unified/main.scad ../../src/unified/main_lowered.scad
