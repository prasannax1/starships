use <../lib/util.scad>;
include <common.scad>;

use <command_engine.scad>;

module command_dildo() {
    util_mirrored([0,0,1])
    translate([0,0,command_width/4])
    scale([1,1,2])
    sphere(d=command_body_width, $fn=faces_convex);

    cylinder(h=command_width/2, d=command_body_width, center=true, $fn=faces_convex);
}

module command_body_base() {
    difference() {
        intersection() {
            rotate([0,90,0])
            scale([1.25,1,1]) 
            command_dildo();

            translate([0,0,-100+.01])
            cube(200, center=true);
        }

        translate([0,0,-command_body_width*.5-3])
        rotate([90,0,0])
        cylinder(r=.5*command_body_width, h=2*command_body_width, $fn=faces_concave, center=true);

        translate([-1.5*command_body_width,0,-1.5*command_body_width-3])
        cube(3*command_body_width, center=true);
        
        translate([command_width/2-5,0,-command_body_width/4-1])
        rotate([0,90,0])
        cylinder(d2=command_height*1.2, d1=command_height*.5, h=command_body_width/2, center=true, $fn=faces_concave);
    }



    difference() {
        intersection() {
            rotate([0,90,0])
            scale([.4,1,1]) 
            command_dildo();

            translate([0,0,100-1])
            cube(200, center=true);
        }

        translate([-command_width/4+10,0,10])
        rotate([90,0,0])
        cylinder(r=10, h=2*command_body_width, $fn=faces_concave, center=true);

        translate([-command_width/4+10,0,0])
        translate([command_width/2,0,10])
        cube([command_width, 2*command_body_width, 20], center=true);
        
        translate([-command_width/2+10,0,0])
        translate([-command_body_width/2,0,command_body_width/2])
        cube(command_body_width, center=true);
    }
}

module command_body() {
    command_body_base();

    translate([.42*command_width,0,command_height/2-.01])
    cylinder(d1=2*command_height, d2=command_height, h=command_height, $fn=faces_convex, center=true);
    
    translate([-command_width/8,0,-6.02])
    linear_extrude(height=6, convexity=10, scale=[1.15,1])
    square([command_width/2,command_width/8], center=true);
    
    util_ovoid(command_width/6, command_width/6, command_width/8, command_width/20, 3, faces_convex);
    
    translate([0,0,3])
    cube([command_height, command_width*.5, 3], center=true);
    
    translate([-command_width/2+10,0,0])
    scale([3,4,1.6])
    difference() {
        sphere(d=8, $fn=faces_rough);
        translate([0,0,-6])
        cube(10,center=true);
    }
}



module command_secondary() {
    command_body();

    util_mirrored([0,1,0])
    translate([0, command_width*.5/2,1.5])
    mirror([0,0,1])
    command_engine(180);
}

command_secondary();
