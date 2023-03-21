use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;

module shuttlepod_body() {
    intersection() {
        scale([3,.64,1.6]) {
            util_mirrored([0,1,0])
            translate([0,1,0])
            sphere(d=2, $fn=6);

            rotate([90,0,0])
            cylinder(d=2,h=2,$fn=6, center=true);
        }

        translate([2-.01-.2, 0, 2-.01-.2])
        cube(4, center=true);
       
        
        scale([7,1,3.8])
        rotate([90,0,0])
        cylinder(d=1, h=4, $fn=4, center=true);
        
        scale([7,3,4.5])
        rotate([0,90,0])
        cylinder(d=1, h=4, $fn=4, center=true);    
    }
}

module shuttlepod_nacelle() {
    rotate([0,90,0]) {
        translate([0,0,.75])
        sphere(d=.5, $fn=10);

        cylinder(d=.5, h=1.5, center=true, $fn=10);
    }
}

