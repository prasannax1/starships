IMG += attack-primary.png
IMG += attack.png
IMG += attack-secondary.png
IMG += diplomat.png
IMG += fighter.png
IMG += heavy-runabout.png
IMG += runabout.png
IMG += science.png
IMG += shuttle-large.png
IMG += shuttle-medium.png
IMG += shuttlepod.png
IMG += shuttle-small.png
IMG += tactical-runabout.png
IMG += yacht.png

all: $(IMG)

attack-primary.png: ../../src/lib/util.scad ../../src/small/attack-primary.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Sunset 

attack.png: attack-primary.png attack-secondary.png
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Sunset 

attack-secondary.png: ../../src/lib/util.scad ../../src/small/attack-secondary.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Sunset 

diplomat.png: ../../src/lib/util.scad ../../src/small/diplomat.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Metallic 

yacht.png: ../../src/lib/util.scad ../../src/small/yacht.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Metallic 

fighter.png: ../../src/lib/util.scad ../../src/small/fighter.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Solarized 

heavy-runabout.png: ../../src/lib/util.scad ../../src/small/heavy-runabout.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t BeforeDawn 

runabout.png: ../../src/lib/util.scad ../../src/small/runabout.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t BeforeDawn 

science.png: ../../src/lib/util.scad ../../src/small/science.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t BeforeDawn 

shuttle-large.png: ../../src/lib/util.scad ../../src/small/shuttle-large.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t DeepOcean 

shuttle-medium.png: ../../src/lib/util.scad ../../src/small/shuttle-medium.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t DeepOcean 

shuttlepod.png: ../../src/lib/util.scad ../../src/small/shuttlepod.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t DeepOcean 

shuttle-small.png: ../../src/lib/util.scad ../../src/small/shuttle-small.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t DeepOcean 

tactical-runabout.png: ../../src/lib/util.scad ../../src/small/tactical-runabout.scad
	bash ../../bin/render.sh \
	    -i ../../src/small/$(basename $(notdir $@)).scad \
	    -p $@ \
	    -t Solarized 


