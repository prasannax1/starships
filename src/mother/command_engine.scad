use <../lib/util.scad>;
include <common.scad>;

module command_nacelle() {
    translate([0,0,5]) {
        translate([command_height,0,0])
        nacelle(command_height, command_height, command_width*1.25);

        translate([command_width/2,0,command_height/2])
        rotate([0,90,0])
        cylinder(d=command_height*1.5, h=command_width/3, center=true, $fn=faces_convex);

        translate([-command_width/2+command_height,0,5])
        util_mirrored([0,1,0])
        rotate([45,0,0])
        translate([0,0,7.5/2])
        cube([25, 1, command_height], center=true);
    }
}

module command_neck(theta, ratio) {
    rotate([-theta,0,0])
    translate([0,0,-.01])
    linear_extrude(height=command_height*ratio, convexity=10, scale=[1.2*ratio,1])
    square([command_height, 4], center=true);
}

module command_engine(theta, ratio) {
    command_neck(theta, ratio);

    translate([0,0,-command_height*.75])
    rotate([-theta,0,0])
    translate([-command_width*.64+command_height*1.5,0,command_height*ratio])
    rotate([theta,0,0])
    command_nacelle();
}

command_engine(180, 2);