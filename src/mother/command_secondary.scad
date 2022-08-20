use <../lib/util.scad>;
include <common.scad>;

use <command_engine.scad>;


//translate([command_width/2,0,-.01]) disk_2();

module command_body_plus() {
    difference() {
        intersection() {
            union() {
                scale([2.5,1,1])
                rotate([0,90,0])
                sphere(d=command_body_width, $fn=faces_convex);

                rotate([0,90,0])
                translate([0,0,-command_width/4])
                cylinder(d=command_body_width, h=command_width/2, center=true, $fn=faces_convex);
    //
    //            rotate([0,90,0])
    //            translate([0,0,-command_width/2])
    //            sphere(d=command_body_width, $fn=faces_convex);
            }


            translate([0,0,-command_width+.01])
            cube(2*command_width, center=true);
        }

        translate([-command_body_width,0,-command_body_width/2-6])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(d=command_body_width, h=command_body_width*2, $fn=faces_concave, center=true);

        translate([-command_body_width,0,-6])
        translate([-command_width/2,0,-command_width/2])
        cube(command_width, center=true);
    }

    translate([-command_width/4-command_height,0,-3])
    linear_extrude(height=15, convexity=10, scale=[.75,.5])
    translate([-command_width*.8/4,0,0])
    square([command_width*.8, command_body_width*.75], center=true);
}

module command_body_minus() {
    translate([command_body_width, 0, -command_body_width/4+5])
    translate([command_body_width/2, 0, -command_body_width/2])
    cube(command_body_width, center=true);
}



module command_assembly() {
    util_mirrored([0,1,0])
    translate([-command_width/3,command_body_width/4,0])
    command_engine(60, 3.75);
}

module command_secondary() {
    difference() {
        command_body_plus();
        command_body_minus();
    }
    
    command_assembly();
}

command_secondary();