#STL += combined_stls 
STL += icp_stls
STL += macs_stls
STL += misc_stls
STL += mother_stls

all: $(STL)

mother_stls: $(wildcard ../src/mother/*.scad)
	@$(MAKE) -C mother

icp_stls: $(wildcard ../src/icp/*.scad)
	@$(MAKE) -C icp

macs_stls: $(wildcard ../src/macs/*.scad)
	@$(MAKE) -C macs

misc_stls: $(wildcard ../src/misc/*.scad)
	@$(MAKE) -C misc

combined_stls: $(wildcard ../src/combined/*.scad)
	@$(MAKE) -C combined
