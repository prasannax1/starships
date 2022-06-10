use <../lib/util.scad>;
include <common.scad>;


module labs(show_hole=false) {
    translate([scout_width,0,labs_height-.01]) disk_0();

    difference() {
        disk_3(show_hole);

        util_repeat_rot(2, [0,0,-160])
        rotate(160)
        translate([labs_width/2,0,labs_height/2])
        cube([75,50,18], center=true);
    }
}

labs(show_hole=true);