IMG += icp_images
IMG += macs_images
IMG += misc_images
IMG += mother_images

all: $(IMG)

mother_images: $(wildcard ../src/mother/*.scad)
	@$(MAKE) -C mothership

icp_images: $(wildcard ../src/icp/*.scad)
	@$(MAKE) -C icp

macs_images: $(wildcard ../src/macs/*.scad)
	@$(MAKE) -C macs

misc_images: $(wildcard ../src/misc/*.scad)
	@$(MAKE) -C misc

