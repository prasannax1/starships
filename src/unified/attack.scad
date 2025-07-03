use <../lib/util.scad>
use <disk0.scad>
use <engine0.scad>
include <common.scad>

module attack() {
    intersection() {
        disk_0();
        cube([disk_0_width*1.1, disk_0_width*.8, disk_0_width], center=true);
    }

    util_mirrored([0,1,0])
    translate([-2.45, disk_0_width*.31, 1.25])
    rotate([90,0,0]) {
        class_0_secondary();
        translate([-disk_0_width*.75,0,class_0_nacelles_w*.35])
        class_0_double_nacelle();
    }
    
    util_mirrored([0,1,0])
    translate([0,disk_0_width*.43,disk_0_deck_h/2]) {
        rotate([0,90,0])
        cylinder(d=1.5*disk_0_deck_h, h=class_0_secondary_l*.4, center=true, $fn=4);

        util_mirrored([1,0,0])
        translate([class_0_secondary_l*.2,0,0])
        rotate([0,90,0])
        sphere(d=1.4*disk_0_deck_h, $fn=4);
    }
}

attack();

