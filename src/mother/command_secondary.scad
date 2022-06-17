use <../lib/util.scad>;
include <common.scad>;

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
    scale([1,1,.5])
    rotate([0,90,0])
    cylinder(d=command_height, h=command_width/4, center=true, $fn=faces_rough);

    translate([-command_width+12.5, 0, -command_height/2+1])
    difference() {
        sphere(d=16, $fn=faces_rough);
        
        translate([0,0,-8])
        cube(16, center=true);
    }
}

module command_nacelle() {
    translate([0,0,5]) {
        nacelle(10, 10, command_width);

        translate([command_width/3.5,0,5])
        rotate([0,90,0])
        cylinder(d=12.5, h=command_width/3, center=true, $fn=faces_convex);

        translate([-command_width/2.5,0,5])
        util_mirrored([0,1,0])
        rotate([45,0,0])
        translate([0,0,7.5/2])
        cube([25, 1, 7.5], center=true);
    }
}

module command_assembly(theta) {
    rotate([-theta,0,0]) {
        hull() {
            translate([-command_width*.8+10,0,command_height*2.4]) sphere(d=3);

            translate([-command_width*.8-10,0,command_height*2.4]) sphere(d=3);

            translate([-.64*command_width+20,0,0]) sphere(d=3);

            translate([-.64*command_width-18,0,0]) sphere(d=3);
        }

        translate([-command_width*1.1,0,command_height*2.4])
        rotate([theta,0,0])
        command_nacelle();
    }
}

module command_secondary() {
    command_body();

    util_mirrored([0,1,0]) command_assembly(command_theta);
}

command_secondary();