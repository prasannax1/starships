use <../lib/util.scad>;
include <common.scad>;

module saucer_plus() {
    disk_4();

    util_repeat_rot(23, [0,0,360/24])
    translate([(labs_width+saucer_upper)/4, 0, saucer_height-.01])
    disk_0();
    
    util_repeat_rot(2, [0,0,360/3])
    translate([(labs_width+saucer_upper)/4, 0, saucer_height-.01])
    disk_1();

    translate([0,0,saucer_height-.01]) disk_0();
}


module saucer_minus() {
    util_repeat_rot(3, [0,0,90])
    translate([-150/2, 0, -25])
    cube([30,30, 8], center=true);
}



module saucer() {
    difference() {
        saucer_plus();
        saucer_minus();
    }
}

saucer();