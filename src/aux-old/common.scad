use <../lib/util.scad>;

module airlock(length) {
    translate([0,0,1])
    rotate([90,0,0]) difference() {
        cylinder(d=2,h=length,center=true,$fn=16);
        util_mirrored([0,0,1])
        translate([0,0,length/2])
        cylinder(d=1.8,h=.1,center=true,$fn=16);
    }
}

