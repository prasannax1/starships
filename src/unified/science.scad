use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;

module science() {
    theta=70;
    disk_0();

    util_mirrored([0,1,0])
    translate([-.5*1.25*disk_0_width, disk_0_width/3, disk_0_deck_h/2 ]) {
        util_mirrored([0,1,0])
        translate([0,disk_0_deck_h/2,0])
        rotate([0,90,0])
        cylinder(d=disk_0_deck_h, h=disk_0_width*1.25, center=true, $fn=6);
        
        cube([disk_0_width*1.25, disk_0_deck_h, disk_0_deck_h], center=true);
    }
    
    translate([-disk_0_width*1.2,0,-1])
    intersection() {
        class_0_secondary();
        
        translate([class_0_secondary_l/3,0,0])
        rotate([0,-15,0])
        cube(class_0_secondary_l, center=true);
    }
    
    util_mirrored([0,1,0])
    translate([0,class_0_secondary_w*.4-1,-2])
    rotate([-theta,0,0]) {
        translate([-disk_0_width*1.2,0,disk_0_width*.2-1])
        cube([4,2,disk_0_width*.4], center=true);
        
        translate([-disk_0_width*1.2,0,disk_0_width*.4])
        //rotate([theta,0,0])
        //rotate([90,0,0])
        class_0_double_nacelle();
    }
    
}

science();