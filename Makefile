all: two_d

two_d: $(wildcard src/*/*/*.scad)
	@$(MAKE) -C images

