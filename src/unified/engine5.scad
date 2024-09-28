use <../lib/util.scad>
include <common.scad>
use <engines.scad>
use <disk0.scad>

module class_5_secondary() {
    sphere(d=disk_1_width*.8, $fn=faces_convex);

    difference() {
        intersection() {
            translate([disk_1_width,0,0])
            cube([2*disk_1_width, 0.4*disk_1_width, disk_1_width], center=true);

            rotate([0,-30,0])
            translate([disk_1_width,0,0])
            cube([2*disk_1_width, 0.4*disk_1_width, disk_1_width], center=true);
        }

        translate([1.5*disk_1_width,0,0]) {
            translate([100,0,0])
            cube([200, 25, 200], center=true);
            
            cylinder(h=200, d=25, $fn=faces_concave, center=true);
        }
    }

    rotate([90,0,0])
    cylinder(h=.4*disk_1_width, d=disk_1_width, center=true, $fn=faces_convex);
    
    rotate([0,-90,0])
    translate([0,0,disk_1_width/2])
    cylinder(d=.5*disk_1_width, h=disk_1_width, center=true, $fn=faces_rough);
    
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([-disk_1_width+36,disk_1_width/4,-disk_1_width/4+10])
    rotate([90,0,0])
    class_5_nacelle();
    
    translate([-class_5_nacelle_hangar_l/2,0,disk_1_width/2-.01-4])
    class_5_hangar();
    
//    translate([disk_1_width/4,0,disk_1_width/2+5])
//    cube([disk_1_width/2, disk_1_width*.4, 10.5], center=true);
}

module class_5_nacelle_flat() {
    hull() {
        //circle(d=disk_1_width, $fn=faces_convex);

        translate([0,disk_1_width/8, 0])
        square([disk_1_width/2, disk_1_width/4], center=true);

        translate([0, disk_1_width/4+disk_1_width/8,0])
        square(disk_1_width/4, center=true);
    }
}

module class_5_nacelle_base() {
    rotate_extrude(angle=360, convexity=2, $fn=faces_convex)
    difference() {
        mirror([0,1,0])
        class_5_nacelle_flat();

        translate([-200,0,0])
        square(400, center=true);
    }
}

module class_5_nacelle_flange() {
    rotate([-90,0,0])
    rotate(90)
    rotate_extrude(angle=90, convexity=3, $fn=faces_concave)
    difference() {
        rotate(-90)
        class_5_nacelle_flat();

        translate([-100,0,0])
        square(200, center=true);
    }
}

module class_5_nacelle() {
    scale([class_5_nacelle_l/(disk_1_width*.5), 1, 1]) {
        class_5_nacelle_flange();
        rotate([0,90,0])
        class_5_nacelle_base();
    }

    class_5_nacelle_base();
    
    sphere(d=disk_1_width/2, $fn=faces_convex);
}

module class_5_hangar() {
    difference() {
        linear_extrude(convexity=10, height=class_5_nacelle_hangar_h, scale=[1, .5])
        hull() {
            util_mirrored([1,0,0])
            translate([class_5_nacelle_hangar_l/2,0,0])
            circle(d=disk_1_width, $fn=faces_convex);
        }

        util_mirrored([1,0,0])
        translate([disk_1_width*.88+class_5_nacelle_hangar_l/2,0,0])
        intersection() {
            rotate([90,0,0])
            cylinder(d=disk_1_width*2, h=200, center=true, $fn=6);

            translate([0,0,150+5])
            cube(300, center=true);
        }
    }

    util_mirrored([1,0,0])
    translate([class_5_nacelle_hangar_l/2,0,0])
    spherical_hangar_door(.8*disk_1_width, .4*disk_1_width);
    
    util_mirrored([1,0,0])
    translate([class_5_nacelle_hangar_l/2,0,class_5_nacelle_hangar_h-.01])
    disk_0();
}

class_5_secondary();

