use <../lib/util.scad>;
include <common.scad>;

use <command_engine.scad>;

module command_body_basic() {
    difference() {
        intersection() {
            translate([0,0,command_width*.75])
            scale([1,1,1])
            rotate([90,0,0])
            rotate_extrude(angle=360, convexity=10, $fn=faces_concave) {
                translate([command_width,0,0])
                circle(d=command_body_width, $fn=faces_convex);

                translate([command_width/2,0,0])
                square([command_width, command_body_width], center=true);
            }

            translate([0,0,-command_width+.01-command_height/2])
            cube(2*command_width, center=true);
        }
        
        scale([5.2,1,1])
        rotate([90,0,0])
        cylinder(r=command_height*1.4, h=command_width, $fn=faces_concave, center=true);
    
        translate([-command_width/2, 0, command_width/2-command_height*1.4])
        cube(command_width, center=true);

        translate([0,0,-command_width/2+command_height*1.55-3])
        rotate([90,0,0])
        cylinder(r=command_width/4, h=command_width, $fn=faces_concave, center=true);

        translate([0,0,-command_width/2+command_height*1.55-3])
        translate([0,0,command_width/4])
        translate([-command_width/2,0,-command_width/2])
        cube(command_width, center=true);
        
        translate([command_width*.63,0,-command_height*2.5])
        rotate([0,90,0])
        cylinder(d2=command_height*1.8, d1=command_height*.5, h=command_height*2.5, center=true, $fn=faces_concave);
    }
    
    translate([0,0,-command_height*2+2.5])
    util_mirrored([0,1,0])
    translate([0,command_height*.75,0])
    linear_extrude(height=5, convexity=10, scale=[1.2,1])
    square([command_width, command_height], center=true);
}



module command_hangar() {
    difference() {
        hull()
        util_mirrored([1,0,0])
        translate([command_width/4,0,0])
        cylinder(d1=command_body_width, d2=bridge_width, h=command_height, $fn=faces_convex, center=true);

        util_mirrored([1,0,0])
        translate([command_width/4+command_body_width/4,0,0])
        cube([command_body_width/2, command_body_width, command_height-6], center=true);
    }

    util_mirrored([1,0,0])
    translate([command_width/4,0,0])
    cylinder(d1=command_body_width-6, d2=bridge_width-4, h=command_height-2, $fn=faces_rough, center=true);
}

module command_secondary() {
    command_body_basic();

    translate([-command_width/4-command_body_width,0,-command_height+1])
    command_hangar();

    translate([0,0,-command_height-6.2])
    command_assembly();
}

module command_assembly() {
    util_ovoid(command_height, command_height, command_height, command_height/2, 2, faces_convex);

    translate([0,0,1.5])
    cube([command_height, command_width*.6, 3], center=true);

    util_mirrored([0,1,0])
    translate([0,command_width*.3,0])
    mirror([0,0,1])
    command_engine(180);
}

command_secondary();