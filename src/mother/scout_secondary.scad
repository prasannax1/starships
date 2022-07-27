use <../lib/util.scad>;
include <common.scad>;
use <scout_engine.scad>;

module scout_body() {
    difference() {
        intersection() {
            hull() {
                scale([2,1,1])
                sphere(d=2*scout_height, $fn=faces_convex);

                translate([-scout_width+scout_height*2,0,0])
                sphere(d=6, $fn=faces_convex);
            }

            translate([scout_height*1.5, 0, 1.5])
            translate([-scout_width, 0, -scout_width])
            cube(2*scout_width, center=true);
        }

        translate([-scout_width+scout_height*2,0,-scout_height-1.5])
        scale([4,1,1])
        rotate([90,0,0])
        cylinder(h=2.5*scout_height, r=scout_height, $fn=faces_concave, center=true);
        
        
        translate([1.5*scout_height, 0, -.25*scout_height])
        scale([.5,1,1])
        sphere(d=scout_height/2, $fn=faces_concave);
    }
}

module scout_secondary() {
    scout_body();

    util_mirrored([0,1,0])
    translate([-scout_width+scout_height*3.3,3,0])
    scout_engine(scout_theta);
}

scout_secondary();