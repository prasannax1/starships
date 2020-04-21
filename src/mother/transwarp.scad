use <../lib/util.scad>;
use <common.scad>;

translate([0,0,.01])
mirror([0,0,1]) {
    util_saucer(500,240,100);
}


difference() {
    translate([0,0,40-.01])
    scale([5,2.4,1])
    intersection() {
        cylinder(80,50,50,center=true);
        cube([100,64,100],center=true);
    }

    translate([-180,0,100])
    rotate([0,45,0])
    cube(500,center=true);
}










