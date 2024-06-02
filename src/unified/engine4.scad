use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>
use <disk0.scad>

module basic_shape() {
    rotate_extrude()
    difference() {
        translate([0, -class_4_body_h/2+.01,0])
        square([class_4_body_w, class_4_body_h], center=true);
        
        translate([class_4_body_w/2,0,0])
        rotate(-45)
        translate([class_4_body_h*2+class_4_body_wall/2,0,0])
        square([class_4_body_h*4, class_4_body_h*4],center=true);

        translate([-class_4_body_h*5,-class_4_body_h/2,0])
        square([class_4_body_h*10, class_4_body_h*2],center=true);
    }
}

module class_4_secondary_disk() {
    difference() {
        rotate_extrude(angle=360, convexity=10, $fn=faces_concave)
        difference() {
            intersection() {
                union() {
                    translate([0,-class_4_body_wall/2+.01,0])
                    square([class_4_body_w, class_4_body_wall], center=true);

                    translate([0,-class_4_body_h+class_4_body_wall/2+.01,0])
                    square([class_4_body_w, class_4_body_wall], center=true);

                    translate([class_4_body_w/2,0,0])
                    rotate(-45)
                    square([class_4_body_wall, class_4_body_h*4],center=true);
                }

                translate([0, -class_4_body_h/2+.01,0])
                square([class_4_body_w, class_4_body_h], center=true);
            }

            translate([class_4_body_w/2,0,0])
            rotate(-45)
            translate([class_4_body_h*2+class_4_body_wall/2,0,0])
            square([class_4_body_h*4, class_4_body_h*4],center=true);
            
            translate([-class_4_body_h*5,-class_4_body_h/2,0])
            square([class_4_body_h*10, class_4_body_h*2],center=true);
            
            square([class_4_body_w-class_4_body_h/2, class_4_body_h/4],center=true);
        }


        translate([class_4_body_w/2+.05, 0, -class_4_body_hangar/2-class_4_body_wall]) {
            cube([class_4_body_w, class_4_body_hangar_w-class_4_body_wall*2, class_4_body_hangar-.1], center=true);
            
            cube([class_4_body_w, class_4_body_hangar_w, class_4_body_hangar-.01-class_4_body_wall*2], center=true);
            
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0, .5*(class_4_body_hangar_w-class_4_body_wall*2), .5*(class_4_body_hangar-class_4_body_wall*2)])
            rotate([0,90,0])
            cylinder(h=class_4_body_w, r=class_4_body_wall, $fn=8, center=true);
        }
        
        translate([-class_4_body_w/2,0,-class_4_body_h/2])
        cube([200, class_4_tail_w-35, 75], center=true);
    }

    translate([0,0,-class_4_body_h+class_4_body_wall-.01])
    disk_0();

    translate([0,0,-class_4_body_h])
    disk_0_under_2();
}

module class_4_secondary_decks() {
    difference() {
        intersection() {
            basic_shape();

            util_repeat(4, [0,0,-15])
            translate([0,0,-20])
            cube([class_4_body_w, class_4_body_w, class_4_body_wall], center=true);
        }

        cube([class_4_body_w*1.2, class_4_body_w*.6, class_4_body_w], center=true);
    }
}

module class_4_secondary_tail() {
    difference() {
        util_mirrored([0,1,0])
        translate([0,class_4_tail_w/2-10,0])
        scale([class_4_tail_l/class_4_body_h,1,1])
        intersection() {
            rotate([90,0,0])
            cylinder(h=20, d=2*class_4_body_h, center=true, $fn=faces_concave);

            translate([-150, 0, -150])
            cube(300, center=true);
        }

        scale([3.75,1,1])
        rotate([90,0,0])
        cylinder(h=300, r=class_4_body_h-10, center=true, $fn=faces_concave);
    }

    difference() {
        translate([-class_4_tail_l*.75+class_4_body_wall, 0, -class_4_body_wall/2])
        cube([class_4_tail_l/2+class_4_body_wall*2, class_4_tail_w, class_4_body_wall], center=true);

        translate([-class_4_tail_l+disk_1_width,0,0]) {
            cylinder(d=disk_1_width-1, h=25, $fn=faces_concave, center=true);

            translate([-disk_1_width,0,0])
            cube([2*disk_1_width, disk_1_width, 25], center=true);
        }
    }
}

module class_4_secondary_bar() {
    translate([-class_4_tail_l+class_4_nacelle_bar_l/2+30, 0, -class_4_nacelle_bar_w/2])
    difference() {
        union() {
            cube([class_4_nacelle_bar_l, class_4_nacelle_disp*2, class_4_nacelle_bar_w], center=true);

            util_mirrored([1,0,0])
            translate([class_4_nacelle_bar_l/2,0,0])
            rotate([90,0,0])
            cylinder(d=class_4_nacelle_bar_w, h=class_4_nacelle_disp*2, center=true, $fn=faces_rough);
        }

        cube([200, class_4_tail_w-10, 50], center=true);
    }
}

module class_4_secondary() {
    class_4_secondary_disk();
    class_4_secondary_decks();
    class_4_secondary_tail();
    class_4_secondary_bar();
}

class_4_secondary();