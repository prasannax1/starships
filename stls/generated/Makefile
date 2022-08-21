all: $(MOTHERSTL) $(SMALLSTL) scale_components.stl

MOTHERSTL += escort.stl
MOTHERSTL += scout.stl
MOTHERSTL += command.stl
MOTHERSTL += saucer.stl
MOTHERSTL += scout_full.stl
MOTHERSTL += scout_simple.stl
MOTHERSTL += scout_engine.stl
MOTHERSTL += command_full.stl
MOTHERSTL += command_engine.stl
MOTHERSTL += command_medium.stl
MOTHERSTL += command_simple.stl
MOTHERSTL += saucer_full.stl
MOTHERSTL += labs_full.stl
MOTHERSTL += labs_medium.stl
MOTHERSTL += carrier.stl
MOTHERSTL += main.stl
MOTHERSTL += main_lowered.stl
MOTHERSTL += warp.stl

$(MOTHERSTL):
	bash ../../bin/render.sh \
	    -i ../../src/mother/$(basename $(notdir $@)).scad \
	    -o $@


SMALLSTL += attack-primary.stl
SMALLSTL += attack.stl
SMALLSTL += attack-secondary.stl
SMALLSTL += diplomat.stl
SMALLSTL += fighter.stl
SMALLSTL += heavy-runabout.stl
SMALLSTL += runabout.stl
SMALLSTL += science.stl
SMALLSTL += shuttle-large.stl
SMALLSTL += shuttle-medium.stl
SMALLSTL += shuttlepod.stl
SMALLSTL += shuttle-small.stl
SMALLSTL += tactical-runabout.stl
SMALLSTL += yacht.stl

$(SMALLSTL):
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -o $@


attack-primary.stl: ../../src/lib/util.scad ../../src/small/attack-primary.scad

attack.stl: attack-primary.stl attack-secondary.stl

attack-secondary.stl: ../../src/lib/util.scad ../../src/small/attack-secondary.scad

diplomat.stl: ../../src/lib/util.scad ../../src/small/diplomat.scad

yacht.stl: ../../src/lib/util.scad ../../src/small/yacht.scad

fighter.stl: ../../src/lib/util.scad ../../src/small/fighter.scad

heavy-runabout.stl: ../../src/lib/util.scad ../../src/small/heavy-runabout.scad

runabout.stl: ../../src/lib/util.scad ../../src/small/runabout.scad

science.stl: ../../src/lib/util.scad ../../src/small/science.scad

shuttle-large.stl: ../../src/lib/util.scad ../../src/small/shuttle-large.scad

shuttle-medium.stl: ../../src/lib/util.scad ../../src/small/shuttle-medium.scad

shuttlepod.stl: ../../src/lib/util.scad ../../src/small/shuttlepod.scad

shuttle-small.stl: ../../src/lib/util.scad ../../src/small/shuttle-small.scad

tactical-runabout.stl: ../../src/lib/util.scad ../../src/small/tactical-runabout.scad

scale_components.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/main.scad \
    ../../src/standard/scale-components-for-stl.scad
	bash ../../bin/render.sh \
	    -i ../../src/standard/scale-components-for-stl.scad \
	    -o $@

escort.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/escort.scad


scout.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad


command.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad


labs.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad

scout_full.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_full.scad \
    ../../src/mother/scout_engine.scad ../../src/mother/scout_secondary.scad

scout_engine.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_engine.scad

scout_simple.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/scout.scad ../../src/mother/scout_simple.scad \
    ../../src/mother/scout_engine.scad

command_full.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_full.scad \
    ../../src/mother/command_engine.scad ../../src/mother/command_secondary.scad

command_medium.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_medium.scad \
    ../../src/mother/scout_engine.scad

command_simple.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_simple.scad \
    ../../src/mother/command_engine.scad

command_engine.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/command.scad ../../src/mother/command_engine.scad

labs_full.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad ../../src/mother/labs_full.scad

labs_medium.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/labs.scad ../../src/mother/labs_medium.scad \
    ../../src/mother/command_engine.scad

saucer.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad

saucer_full.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/saucer.scad ../../src/mother/saucer_full.scad

carrier.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/carrier.scad

warp.stl: ../../src/lib/util.scad ../../src/mother/common.scad  \
    ../../src/mother/warp.scad

main.stl: \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/main.scad


main_lowered.stl: \
    ../../src/mother/command.scad \
    ../../src/mother/labs.scad \
    ../../src/mother/saucer.scad \
    ../../src/mother/carrier.scad \
    ../../src/mother/scout.scad \
    ../../src/mother/escort.scad \
    ../../src/mother/warp.scad \
    ../../src/mother/main_lowered.scad
