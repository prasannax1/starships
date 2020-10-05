STL += cruiser.stl 
STL += cruiser2.stl 
STL += cruiser3.stl

all: $(STL)


$(STL):
	../../bin/render.sh \
	    -i ../../src/misc/$(basename $(notdir $@)).scad \
	    -o $@


cruiser.stl: ../../src/lib/util.scad ../../src/misc/cruiser.scad

cruiser2.stl: ../../src/lib/util.scad ../../src/misc/cruiser2.scad

cruiser3.stl: ../../src/lib/util.scad ../../src/misc/cruiser3.scad

