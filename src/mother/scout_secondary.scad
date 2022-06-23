use <../lib/util.scad>;
include <common.scad>;
use <scout_engine.scad>;

module scout_body_plus() {
    rotate([0,90,0])
    intersection() {
        union() {
            translate([0,0,scout_width/8]) sphere(d=scout_height*2, $fn=faces_convex);

            translate([0,0,-scout_width/8]) scale([1,1,5]) sphere(d=scout_height*2, $fn=faces_convex);

            cylinder(d=scout_height*2, h=scout_width/4, $fn=faces_convex, center=true);
        }

        translate([0,0,scout_width/8 + scout_width/16])
        translate([0,0,-scout_width/4*1.2])
        cube(scout_width/2*1.2, center=true);
    }

    translate([-scout_width*.41, 0, -scout_height/2])
    cylinder(d=scout_height*1.64, h=scout_height, $fn=faces_convex, center=true);
}

module scout_body_minus() {
    translate([scout_width/8 + scout_width/16,0,0])
    scale([.25,1,1])
    sphere(d=13, $fn=faces_concave);
    
    translate([-scout_width*.41, 0, -scout_height-1])
    scale([2,1,1])
    rotate([90,0,0])
    cylinder(r=scout_height, h=scout_width/2, $fn=faces_concave, center=true);

    translate([-scout_width*.41, 0, -1])
    translate([-scout_width/4, 0, -scout_width/4])
    cube(scout_width/2, center=true);
}

module scout_extra() {
    translate([-scout_width*.41, 0, 0]) 
    difference() {
        sphere(d=15, $fn=faces_rough);

        translate([0,0,-10-.5])
        cube(20, center=true);
    }
    
    translate([-scout_width*.41, 0, -1]) 
    cylinder(d1=3, d2=6, $fn=faces_rough, center=true, h=2);
    
    translate([5,0,10])
    cube([20,6+.01,20], center=true);
    
    translate([25/2,0,16.25])
    cube([25+.02,6+.01, 7.5] ,center=true);
}



module scout_assembly() {
    util_mirrored([0,1,0])
    rotate([-scout_theta,0,0])
    translate([-18,0,0])
    mirror([0,0,1])
    translate([0,0,-15])
    scout_engine();
}

module scout_body() {
    scout_extra();
    difference() {
        scout_body_plus();
        scout_body_minus();
    }
}
module scout_secondary() {
    scout_body();
    scout_assembly();
}

scout_secondary();