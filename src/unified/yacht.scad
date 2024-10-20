use <../lib/util.scad>
use <disk0.scad>
use <engine0.scad>
include <common.scad>

module yacht() {
    disk_0();

    translate([-1,0,0])
    class_0_secondary();


    theta=60;

    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-disk_0_width/4,0,-class_0_secondary_w])
        
        rotate([-theta,0,0])
        class_0_nacelle();

        translate([-class_0_nacelles_w/2,0,-class_0_secondary_w/2])
        cube([class_0_nacelles_w,1.5,class_0_secondary_w], center=true);
    }
}

yacht();