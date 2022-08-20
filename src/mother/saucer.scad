use <../lib/util.scad>;
include <common.scad>;

module saucer_plus(labs_attached=true) {
    if (labs_attached == true) {
        disk_4();
    } else {
        disk_4(show_holes = true);
    }

//    util_repeat_rot(23, [0,0,360/24])
//    translate([(labs_width+saucer_upper)/4, 0, saucer_height-.01])
//    disk_0();
    
    util_mirrored([0,1,0])
    util_repeat_rot(1, [0,0,-360/16])
    rotate(100)
    translate([(labs_width+saucer_upper)/4+4, 0, saucer_height-.01])
    rotate(180)
    disk_1();

    translate([0,0,saucer_height-labs_height/2-.01]) disk_0();
}


module saucer_minus() {
    util_repeat_rot(3, [0,0,90])
    translate([-150/2, 0, -25])
    cube([30,30, 8], center=true);
}



module saucer(labs_attached=true) {
    difference() {
        saucer_plus(labs_attached);
        saucer_minus();
    }
}

saucer(false);