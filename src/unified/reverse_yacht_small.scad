include <common.scad>;
use <disks.scad>;
use <engines.scad>;
use <../lib/util.scad>;

module reverse_yacht_small() {
    mirror([0,0,1])
    disk_point_5();

    util_mirrored([0,1,0])
    translate([-12, (disk_0_upper_d+4*disk_0_deck_h)/2-class_0_nacelles_w*0, -class_0_nacelles_w/2])
    class_0_nacelle();
}

reverse_yacht_small();