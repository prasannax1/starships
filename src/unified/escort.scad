use <disk0.scad>
use <engine0.scad>
use <disk1.scad>
use <engine1.scad>
use <../lib/util.scad>
include <common.scad>

module escort() {
    difference() {
        intersection() {
            disk_1();
            
            translate([0,0,.6*disk_1_width])
            cube(1.2*disk_1_width, center=true);
        }
        
        util_mirrored([0,1,0]) {
            translate([0,disk_1_width/2,0])
            cylinder(r=2.5*class_0_nacelles_w, h=2.5*disk_1_height, $fn=4, center=true);

            translate([-disk_1_width/2, disk_1_width/2, 0])
            cube([disk_1_width, 5*class_0_nacelles_w, 2.5*disk_1_height], center=true);
        }
        
        translate([-disk_1_width*.7,0,0])
        rotate(30)
        cylinder(d=disk_1_width,h=3*disk_1_height, $fn=6, center=true);
        
        translate([disk_1_width*.5,0,0])
        scale([.5,1,1])
        rotate(30)
        cylinder(d=disk_0_upper_d*1.2,h=3*disk_1_height, $fn=6, center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-class_1_nacelle_l/5,disk_1_width/2-class_1_nacelle_w*.75,class_1_nacelle_w/4])
    rotate([-90,0,0])
    class_1_nacelle();
    
    util_mirrored([0,1,0])
    translate([0,disk_1_width/3,.01])
    class_0_secondary();
    
//    translate([0,0,-1.5])
//    class_1_sec_body();
    
    util_mirrored([0,1,0])
    translate([-5,disk_1_width/4,2.5])
    rotate([90,0,0])
    class_1_neck();
    
    util_mirrored([0,1,0])
    translate([-disk_1_width*.26,disk_0_width/2,disk_0_deck_h*1.2+1])
    difference() {
        rotate([90,0,0])
        rotate(30)
        cylinder(h=disk_0_upper_d, r=disk_0_deck_h*1.2, $fn=6, center=true);
        
        translate([-disk_0_deck_h,0,0])
        cube([2, 10,2], center=true);
    }
    
    disk_0_under_2();
    //mirror([0,0,1]) disk_0();
}

escort();
