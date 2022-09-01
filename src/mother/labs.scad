use <../lib/util.scad>;
include <common.scad>;

module labs(show_hole=false) {
    util_mirrored([0,1,0])
    translate([-command_width/2-scout_width, scout_width*.55, labs_height/2-.01])
    disk_1();
    
    difference() {
        disk_3(show_hole);

        util_mirrored([0,1,0])
        util_repeat(1, [0,70,0])
        translate([-saucer_width/2+labs_height*2, 35, 0])
        cube([40,60,25], center=true);
    }
}



labs(show_hole=true);

