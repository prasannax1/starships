use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>

module class_0_nacelle() {
    intersection() {
        translate([class_0_nacelles_l/4,0,0])
        scale([2*class_0_nacelles_l/class_0_nacelles_w,1,1])
        sphere(d=class_0_nacelles_w, $fn=faces_convex);

        translate([-class_0_nacelles_l/8,0,0])
        cube(class_0_nacelles_l, center=true);
    }

    translate([class_0_nacelles_l/2-class_0_nacelles_l/8,0,0])
    sphere(d=class_0_nacelles_w*.8, $fn=faces_convex);
}

module class_0_attack_engine() {
    class_0_secondary();
    translate([-class_0_nacelles_l*.75,0,0])
    class_0_double_nacelle();
}


module class_0_double_nacelle() {
    difference() {
        union() {
            util_mirrored([0,1,0])
            translate([0,class_0_nacelles_w/2,0])
            class_0_nacelle();

            intersection() {
                translate([class_0_nacelles_l/4,0,0])
                scale([2*class_0_nacelles_l/class_0_nacelles_w,1,1])
                rotate([90,0,0])
                cylinder(d=class_0_nacelles_w, h=class_0_nacelles_w, $fn=faces_convex, center=true);

                translate([-class_0_nacelles_l/8,0,0])
                cube(class_0_nacelles_l, center=true);
            }
        }
        
        translate([-class_0_nacelles_l*5/8,0,0])
        rotate([90,0,0])
        cylinder(d=1,h=class_0_nacelles_w, center=true, $fn=faces_rough);
    }
}

module class_0_hangars() {
    difference() {
        union() {
            translate([0,0,disk_0_deck_h])
            cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

            linear_extrude(convexity=10, height=2*disk_0_deck_h, scale=[1,(disk_0_upper_d/ (disk_0_upper_d+2*disk_0_deck_h))])
            translate([-class_0_hangar_l/2,0,0])
            square([class_0_hangar_l, disk_0_upper_d+2*disk_0_deck_h], center=true);

            translate([-class_0_hangar_l,0,disk_0_deck_h])
            cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

            scale([1,1,.25]) {
                sphere(d=disk_0_upper_d+2*disk_0_deck_h, $fn=faces_convex);

                rotate([0,-90,0])
                translate([0,0,class_0_hangar_l/2])
                cylinder(d=disk_0_upper_d+2*disk_0_deck_h, h=class_0_hangar_l, center=true, $fn=faces_convex);

                translate([-class_0_hangar_l,0,0])
                sphere(d=disk_0_upper_d+2*disk_0_deck_h, $fn=faces_convex);
            }
        }

        translate([disk_0_upper_d+.1,0,disk_0_deck_h])
        cube([2*disk_0_upper_d, 2*disk_0_upper_d, 4], center=true);

        translate([-disk_0_upper_d-class_0_hangar_l-.1,0,disk_0_deck_h])
        cube([2*disk_0_upper_d, 2*disk_0_upper_d, 4], center=true);
    }

    translate([0,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h-1), d2=disk_0_upper_d-.5, h=disk_0_deck_h*2-1, center=true, $fn=faces_rough);

    translate([-class_0_hangar_l,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h-1), d2=disk_0_upper_d-.5, h=disk_0_deck_h*2-1, center=true, $fn=faces_rough);
}

module class_0_secondary() {
    difference(){
        intersection() {
            rotate([0,90,0])
            rotate(90)
            cylinder(d=class_0_secondary_w, h=class_0_secondary_l, $fn=6, center=true);

            translate([0,0,-class_0_secondary_l*.75+.01])
            cube(class_0_secondary_l*1.5, center=true);
            
            translate([class_0_secondary_l/2,0,0])
            rotate([0,45,0])
            translate([-class_0_secondary_l*.75,0,-class_0_secondary_l*.75])
            cube(class_0_secondary_l*1.5, center=true);
        }
        
        translate([class_0_secondary_l/2,0,0])
        translate([-class_0_secondary_w/4,0,0])
        intersection() {
            rotate([0,90,0])
            rotate(90)
            cylinder(d=class_0_secondary_w-1, h=class_0_secondary_w/2, center=true, $fn=6);

            translate([0,0,-class_0_secondary_w*.75-.5])
            cube(class_0_secondary_w*1.5, center=true);
        }
        
        translate([-class_0_secondary_l/2,0,-class_0_secondary_w/2-.5])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder(d=class_0_secondary_w, h=class_0_secondary_w*2, center=true, $fn=6);
    }

    translate([class_0_secondary_l/2-class_0_secondary_w/2,0,0])
    intersection() {
        rotate(90)
        sphere(d=class_0_secondary_w-2, $fn=6);
        
        translate([0,0,-class_0_secondary_w/2-.05])
        cube(class_0_secondary_w, center=true);
    }
}


module class_0_habitat() {
    difference() {
        intersection() {
            scale([5,1,1])
            sphere(d=disk_0_upper_d, $fn=faces_convex);
            
            cube(disk_0_width, center=true);
        }
        
        util_mirrored([0,1,0])
        util_mirrored([0,0,1])
        util_mirrored([1,0,0]) {
            util_repeat(2, [-6,0,0])
            translate([0, disk_0_upper_d/2-1, 1.5])
            rotate(90)
            porthole();
            
            util_repeat(1, [-6,0,0])
            translate([0, disk_0_upper_d/2-2.5, 4.5])
            rotate(90)
            porthole();
        }
    }
    
    difference() {
        rotate([0,90,0])
        cylinder(d=disk_0_upper_d*.7, h=disk_0_width+1, center=true, $fn=faces_convex);
        
        util_mirrored([1,0,0]) {
            translate([disk_0_width/2+.75, 0, 1.5])
            window();
            
            util_mirrored([0,1,0])
            translate([disk_0_width/2+.75, .75, -1.5])
            porthole();
        }
    }
    
    translate([disk_1_height*.75,0,disk_1_height*.5/2])
    cylinder(d1=disk_0_upper_d*.75, d2=disk_0_upper_d*.3, h=disk_1_height*.5, center=true, $fn=faces_convex);
    
        translate([-disk_1_height*.75,0,disk_1_height*.25])
    cylinder(d1=disk_0_upper_d*.75, d2=disk_0_upper_d*.3, h=disk_1_height*.5, center=true, $fn=faces_convex);
}

class_0_secondary();