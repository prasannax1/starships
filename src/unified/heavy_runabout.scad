use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;

module heavy_runabout() {
    translate([-class_0_secondary_l/5,0,disk_0_deck_h*2-.01-.4])
    scale([.6,1,.5])
    mirror([0,0,1])
    class_0_secondary();

    util_mirrored([0,1,0])
    translate([-class_0_secondary_l*.2, disk_0_upper_d/2-1,class_0_nacelles_w+1])
    rotate([-30,0,0])
    scale([.6,1,.5])
    class_0_nacelle();

    difference() {
        disk_point_5();

        util_mirrored([0,1,0]) {
            util_repeat_rot(2, [0,0,25])
            rotate(12.5)
            translate([disk_0_upper_d-disk_0_deck_h, 0, disk_0_deck_h/2]) porthole();

            util_repeat(3, [-4,0,0])
            rotate(90)
            translate([disk_0_upper_d-disk_0_deck_h, 0, disk_0_deck_h/2]) porthole();
        }
    }
}

heavy_runabout();