use <../lib/util.scad>
use <disks.scad>
use <engines.scad>
include <common.scad>

module diplomat() {
    disk_0();

    translate([-disk_0_width*.45,0,0])
    class_0_secondary();


    theta=60;
    util_mirrored([0,1,0])
    translate([-disk_0_width*.85-1,class_0_secondary_w/2-1,-.5])
    rotate([-theta,0,0]) {
        translate([-class_0_nacelles_w/2,0,0])
        linear_extrude(height=class_0_secondary_w, convexity=10, scale=[1/3,1])
        translate([class_0_nacelles_w*3/2,0,0])
        square([class_0_nacelles_w*3,1], center=true);
    
        translate([-class_0_nacelles_w,0,class_0_secondary_w])        
        rotate([theta,0,0])
        class_0_nacelle();
    }


    
}

diplomat();