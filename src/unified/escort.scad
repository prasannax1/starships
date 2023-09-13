use <disks.scad>
use <engines.scad>
use <../lib/util.scad>
include <common.scad>

module escort() {
    difference() {
        disk_1();
        
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
        rotate(30)
        cylinder(d=disk_0_upper_d*1.2,h=3*disk_1_height, $fn=6, center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-class_1_nacelle_l/5,disk_1_width/2-class_1_nacelle_w*.75,class_1_nacelle_w/4])
    rotate([-90,0,0])
    class_1_nacelle();
    
    class_0_secondary();
    
    //translate([0,0,-1.5])
    //class_1_sec_body();
    
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
}

escort();
