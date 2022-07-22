use <../lib/util.scad>;
include <common.scad>;


module labs(show_hole=false) {
    util_repeat_rot(7, [0,0,360/8])
    translate([scout_width+20,0,labs_height/2-.01]) disk_0();

    difference() {
        disk_3(show_hole);

        util_repeat_rot(2, [0,0,-160])
        rotate(160)
        translate([labs_width/2,0,labs_height/4])
        cube([75,50,18], center=true);
    }
}

labs(show_hole=true);

