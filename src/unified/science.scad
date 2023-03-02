use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;

module science() {
    disk_0();

    util_mirrored([0,1,0])
    translate([-class_0_nacelles_l*.5, disk_0_width/2-class_0_nacelles_w/2, disk_0_deck_h/2])
    rotate([90,0,0])
    class_0_double_nacelle();

    translate([-class_0_secondary_l/2,0,0])
    class_0_secondary();

    translate([-disk_0_width+4,0,-.5]) {
        cube([5,disk_0_width-class_0_nacelles_w/2,2], center=true);

        util_mirrored([1,0,0])
        translate([2.5,0,0])
        rotate([90,0,0])
        cylinder(d=2, h=disk_0_width-class_0_nacelles_w/2, center=true, $fn=20);
    }
}

science();