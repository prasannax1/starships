use <../lib/util.scad>;
include <common.scad>;
                                             

module scout_nacelle() {
    difference() {
        hull() {
            translate([0,0,-scout_height/2+1.5])
            scale([2,1,1])
            sphere(d=scout_height, $fn=faces_convex);

            translate([-scout_width+scout_height/2,0,-1.5])
            scale([1,1,1])
            rotate([0,0,0])
            sphere(d=8, $fn=8);
        }

        translate([-scout_width+scout_height/2,0,0])
        rotate([0,-45,0])
        translate([-scout_height/2,0,0])
        cube(scout_height, center=true);
        
        translate([-scout_width+scout_height/2,0,-scout_height+1.5])
        scale([10,1,1])
        rotate([90,0,0])
        cylinder(r=scout_height-6, h= scout_height*.75, $fn=faces_concave, center=true);
    }



    difference() {
        intersection() {
            translate([0,0,-scout_height/2+1.5])
            rotate([0,4,0])
            scale([scout_width/scout_height,1,1])
            sphere(d=scout_height*1.2, $fn=faces_convex);

            translate([5,0,0])
            rotate([0,15,0])
            translate([-scout_width/2,0,0])
            cube(scout_width, center=true);
        }

        translate([0,0,-scout_width/2])
        cube([scout_width*2, scout_height/2,scout_width], center=true);
    }
}

module scout_neck() {
    translate([0,0,-.01])
    linear_extrude(height = 2*scout_height, convexity = 10, scale=[2,1])
    translate([-scout_height*.75,0,0])
    square([scout_height*.75,2], center=true);
}

module scout_engine(theta) {
    rotate([-theta,0,0]) {
        scout_neck();
        translate([0,0,scout_height*2])
        rotate([theta,0,0])
        scout_nacelle();
    }
}

scout_engine(180);