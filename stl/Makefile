STL += aux_stls
STL += mother_stls

all: $(STL)

mother_stls: $(wildcard ../src/mother/*.scad)
	@$(MAKE) -C mother

aux_stls: $(wildcard ../src/aux/*.scad)
	@$(MAKE) -C aux

