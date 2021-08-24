IMG += aux_images
IMG += mother_images

all: $(IMG)

mother_images: $(wildcard ../src/mother/*.scad)
	@$(MAKE) -C mother

aux_images: $(wildcard ../src/small/*.scad)
	@$(MAKE) -C small

