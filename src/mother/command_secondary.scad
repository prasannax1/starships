use <../lib/util.scad>;
include <common.scad>;

use <command_engine.scad>;

module command_body() {
    difference() {
        intersection() {
            translate([-command_width/2,0,-command_height/2])
            util_ovoid(command_width/2, command_width/2, command_height*2, command_height, command_height, faces=faces_convex);

            translate([-10,0,+.01])
            translate([-command_width/2, 0, -command_width/2])
            cube(command_width, center=true);
        }

        translate([-10,0,-command_height/2])
        scale([.25,1,1])
        sphere(d=15, $fn=faces_concave);
        
        translate([-command_height, 0, -command_height])
        translate([-command_width/2,0,-command_height/2])
        rotate([90,0,0])
        cylinder(r=command_height, h=command_width, center=true, $fn=faces_concave);

        translate([-command_height,0,0])
        translate([-command_width/2,0,-command_height/2])
        translate([-command_width/2, 0, -command_width/2])
        cube(command_width, center=true);
        
        translate([-command_width+12, 0, -command_height/2+1])
        translate([-command_height/2,0,command_height/2])
        cube(command_height, center=true);
    }

    translate([-.64*command_width,0,0])
    scale([1,1,.75])
    rotate([0,90,0])
    cylinder(d=command_height, h=command_width/4, center=true, $fn=faces_rough);

    translate([-command_width+12.5, 0, -command_height/2+1])
    difference() {
        sphere(d=16, $fn=faces_rough);
        
        translate([0,0,-8])
        cube(16, center=true);
    }
}

module command_assembly() {
    translate([-.7*command_width,0,3])
    cube([command_height, command_width/2, 2], center=true);

    util_mirrored([0,1,0])
    translate([-.7*command_width,command_width/4-command_height/2,3])
    mirror([0,0,1])
    command_engine();
}


module command_secondary() {
    translate([-bridge_width,0,0]) {
        command_body();
        command_assembly();
    }
}

command_secondary();