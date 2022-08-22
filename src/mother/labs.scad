use <../lib/util.scad>;
include <common.scad>;

module labs(show_hole=false) {
    util_repeat_rot(7, [0,0,360/8])
    translate([scout_width+10,0,labs_height/2-.01]) disk_0();

    difference() {
        disk_3(show_hole);

        util_mirrored([0,1,0])
        util_repeat(1, [0,70,0])
        translate([-saucer_width/2+labs_height*2, 35, 0])
        cube([40,60,25], center=true);
    }
}



labs(show_hole=true);

