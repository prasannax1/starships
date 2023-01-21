use <../lib/util.scad>
use <disks.scad>
use <engines.scad>
include <common.scad>

faces_armor=faces_rough/3;

module attack_no_armor() {
    disk_0();
    util_mirrored([0,1,0])
    translate([-disk_0_width/4,disk_0_upper_d/2+disk_0_deck_h*2-.01,0])
    rotate([45,0,0])
    translate([0,0,disk_0_deck_h])
    rotate([90,0,0]) 
    attack_engine();
}

module attack_engine() {
    class_0_attack_engine();
}

module attack() {
    attack_no_armor();
    attack_armor();
}


module attack_armor() {
    attack_armor_1();
    attack_armor_2();
    attack_armor_3();
}

module attack_armor_1() {
    difference() {
        intersection() {
            translate([-disk_0_width/2,0,0])
            scale([2.5,1.05,6*disk_0_deck_h/disk_0_width])
            sphere(d=disk_0_width, $fn=faces_armor);

            util_mirrored([0,1,0])
            translate([-disk_0_width/2,disk_0_width*.6,1.2*disk_0_deck_h])
            scale([2.75,1,1])
            cylinder(d=disk_0_width, h=2.4*disk_0_deck_h, center=true, $fn=6);
        }

        translate([-disk_0_width,0,-disk_0_width*.4])
        scale([2,1,1])
        rotate([45,0,0])
        cube(disk_0_width, center=true);
    }
}

module attack_armor_2() {
    difference() {
        intersection() {
            scale([1,1,4.2*disk_0_deck_h/disk_0_width])
            sphere(d=disk_0_width, $fn=faces_armor);

            translate([0,0,1.2*disk_0_deck_h])
            cube([disk_0_width*1.2, disk_0_width*1.2, 2.4*disk_0_deck_h], center=true);
        }

        cylinder(d=disk_0_upper_d+2, h=5*disk_0_deck_h, center=true, $fn=faces_concave);
    }
}

module attack_armor_3() {
    difference() {
        intersection() {
            translate([-disk_0_width/2,0,0])
            scale([2.5,1.05,2.5*disk_0_deck_h/disk_0_width])
            sphere(d=disk_0_width, $fn=faces_armor);

            util_mirrored([0,1,0])
            translate([-disk_0_width/2,disk_0_width*.6,-1.2*disk_0_deck_h])
            scale([2.75,1,1])
            cylinder(d=disk_0_width, h=2.4*disk_0_deck_h, center=true, $fn=6);
        }

        translate([-disk_0_width/2,0,-disk_0_width*.4])
        scale([2,1,1])
        rotate([45,0,0])
        cube(disk_0_width, center=true);
    }
}


attack();