all: two_d three_d

two_d: $(wildcard src/*/*/*.scad)
	@$(MAKE) -C images

three_d: $(wildcard src/*/*/*.scad)
	@$(MAKE) -C stls