use <../lib/util.scad>;
include <common.scad>;
use <secondaries.scad>;

use <labs.scad>;
use <command.scad>;
use <scout.scad>;

module saucer_plus() {
    disk_4();

    translate([0,0,saucer_height])
    disk_1();
}

module saucer_minus(scout_attached) {
    util_repeat_rot(4, [0,0,90])
    translate([-labs_width/2, 0, -7])
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0, 25, 4])
    rotate([0,90,0])
    cylinder(d=2, h=30, $fn=12, center=true);
    
//    translate([-saucer_width/2,0,0])
//    scale([.99, .99, 4])
//    hex();
    
    translate([0,0,-labs_height-command_height])
    cylinder(h=2, d=scout_width+2, $fn=faces_concave, center=true);
    
    if (scout_attached == false) {
        translate([0,0,-labs_height-command_height])
        cylinder(d1=scout_width+20, d2=scout_width-20, h=20, center=true, $fn=faces_concave);

        translate([0,0,-labs_height-command_height+scout_height/2])
        sphere(d=20, $fn=faces_concave);
        
        translate([0,0,-labs_height-command_height])
        translate([-scout_width/4, 0, scout_height/2])
        cube([scout_width/2, 15, scout_height*1.5], center=true);
    }
}

module saucer_impulse() {
    difference() {
        hull()
        util_mirrored([0,1,0])
        translate([0,command_height,0])
        rotate([0,90,0])
        rotate(90)
        cylinder(d=command_height, h=command_width, $fn=6, center=true);

        util_mirrored([0,1,0])
        translate([-command_width/2,command_height,0])
        rotate([0,90,0])
        rotate(90)
        cylinder(d=command_height*.8, h=scout_height, $fn=6, center=true);
    }
}

module saucer(scout_attached=true) {
    difference() {
        saucer_plus();
        saucer_minus(scout_attached);
    }
    
    util_mirrored([0,1,0])
    translate([-saucer_width/2+command_width/2,scout_width/2,saucer_height/2]) saucer_impulse();
}

saucer(scout_attached=false);
