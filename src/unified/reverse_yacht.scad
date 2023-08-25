include <common.scad>;
use <disks.scad>;
use <engines.scad>;
use <../lib/util.scad>;

module reverse_yacht() {
    mirror([0,0,1])
    disk_0();

    mirror([0,0,1])
    translate([0,0,0])
    class_0_secondary();

    util_mirrored([0,1,0])
    translate([-12, disk_0_width/2-class_0_nacelles_w/2, -class_0_nacelles_w/2])
    class_0_nacelle();
}

reverse_yacht();