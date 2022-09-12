use <../lib/util.scad>;
include <common.scad>;

module labs(show_hole=false) {
    util_mirrored([0,1,0])
    translate([-command_width/2-scout_width, scout_width*.6, labs_height/2-.01-3])
    disk_1();
    
    difference() {
        disk_3(show_hole);

        util_mirrored([0,1,0])
        util_repeat(1, [0,70,0])
        translate([-saucer_width/2+labs_height*2, 35, 0])
        cube([40,60,25], center=true);
        
        util_mirrored([0,1,0])
    translate([-command_width/2-scout_width, scout_width*.6, labs_height/2-.01])
        cylinder(d1=scout_width, d2=scout_width+12, h=6-.02, center=true, $fn=faces_concave);
    }
}



labs(show_hole=true);

