use <../lib/util.scad>;
include <common.scad>;
use <scout_engine.scad>;

module scout_body() {
    difference() {
        intersection() {
            hull() {
                scale([1.5,1,1])
                sphere(d=2*scout_height, $fn=faces_convex);

                translate([-scout_width+scout_height*2,0,0])
                sphere(d=12, $fn=faces_convex);
            }

            union() {
                translate([scout_height*1.25, 0, 1.5+9])
                translate([-scout_width, 0, -scout_width])
                cube(2*scout_width, center=true);
                


                translate([-20,0,0])
                translate([-scout_width,0,0])
                cube(2*scout_width, center=true);
            }
        }

        translate([-scout_width+scout_height*2,0,-scout_height-1.5])
        scale([4,1,1])
        rotate([90,0,0])
        cylinder(h=2.5*scout_height, r=scout_height, $fn=faces_concave, center=true);
        
        
        translate([1.25*scout_height, 0, 0])
        scale([.25,1,1])
        sphere(d=scout_height, $fn=faces_concave);
        
        translate([-scout_width+scout_height*2,0,0])
        translate([-6,0,6])
        cube(12, center=true);
        
        translate([0,0,9])
        translate([0,0,scout_width])
        cube(2*scout_width, center=true);
    }
    
    translate([-scout_width+scout_height*2,0,0])
    difference() {
        sphere(d=11, $fn=faces_rough);
        
        translate([0,0,-7])
        cube(12, center=true);
    }
}




module scout_secondary() {
    scout_body();

    util_mirrored([0,1,0])
    translate([-scout_width+scout_height*4,5,5])
    scout_engine(scout_theta);
}

scout_secondary();