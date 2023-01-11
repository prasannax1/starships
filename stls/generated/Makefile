unifiedSTL += escort.stl
unifiedSTL += scout.stl
unifiedSTL += command.stl
unifiedSTL += saucer.stl
unifiedSTL += scout_full.stl
unifiedSTL += scout_simple.stl
unifiedSTL += command_full.stl
unifiedSTL += command_alt.stl
unifiedSTL += command_simple.stl
unifiedSTL += saucer_full.stl
unifiedSTL += labs_full.stl
unifiedSTL += labs_alt.stl
unifiedSTL += carrier.stl
unifiedSTL += main.stl
unifiedSTL += main_lowered.stl
unifiedSTL += warp.stl
unifiedSTL += attack.stl
unifiedSTL += diplomat.stl
unifiedSTL += yacht.stl

SMALLSTL += fighter.stl
SMALLSTL += heavy-runabout.stl
SMALLSTL += runabout.stl
SMALLSTL += science.stl
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



attack.stl: ../../src/lib/util.scad ../../src/unified/attack.scad

diplomat.stl: ../../src/lib/util.scad ../../src/unified/diplomat.scad

yacht.stl: ../../src/lib/util.scad ../../src/unified/yacht.scad

fighter.stl: ../../src/lib/util.scad ../../src/small/fighter.scad

heavy-runabout.stl: ../../src/lib/util.scad ../../src/small/heavy-runabout.scad

runabout.stl: ../../src/lib/util.scad ../../src/small/runabout.scad

science.stl: ../../src/lib/util.scad ../../src/small/science.scad

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

escort.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/escort.scad


scout.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/scout.scad


command.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/command.scad

labs.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/labs.scad

scout_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/scout.scad ../../src/unified/scout_full.scad

scout_simple.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/scout.scad ../../src/unified/scout_simple.scad

command_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/command.scad ../../src/unified/command_full.scad

command_alt.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/command.scad ../../src/unified/command_alt.scad

command_simple.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/command.scad ../../src/unified/command_simple.scad

labs_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/labs.scad ../../src/unified/labs_full.scad

labs_alt.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/labs.scad ../../src/unified/labs_alt.scad

saucer.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/saucer.scad

saucer_full.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/saucer.scad ../../src/unified/saucer_full.scad

carrier.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/carrier.scad

warp.stl: ../../src/lib/util.scad ../../src/unified/common.scad  \
    ../../src/unified/warp.scad

main.stl: \
    ../../src/unified/command.scad \
    ../../src/unified/labs.scad \
    ../../src/unified/saucer.scad \
    ../../src/unified/carrier.scad \
    ../../src/unified/scout.scad \
    ../../src/unified/escort.scad \
    ../../src/unified/warp.scad \
    ../../src/unified/main.scad


main_lowered.stl: \
    ../../src/unified/command.scad \
    ../../src/unified/labs.scad \
    ../../src/unified/saucer.scad \
    ../../src/unified/carrier.scad \
    ../../src/unified/scout.scad \
    ../../src/unified/escort.scad \
    ../../src/unified/warp.scad \
    ../../src/unified/main_lowered.scad
