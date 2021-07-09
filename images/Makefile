IMG += aux_images
IMG += mother_images

all: $(IMG)

mother_images: $(wildcard ../src/mother/*.scad)
	@$(MAKE) -C mothership

aux_images: $(wildcard ../src/aux/*.scad)
	@$(MAKE) -C aux

