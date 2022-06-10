use <../lib/util.scad>;
include <common.scad>;


module command_body_plus() {
    intersection() {
        union() {
            util_ovoid(command_width/4, command_width*.75, 36, 18, 18, faces=faces_convex);

            scale([2.5,1,1])
            cylinder(d=40, h=3, center=true, $fn=faces_convex);
        }

        translate([-command_width/2+10+30,0,0])
        cube(command_width-40, center=true);
    }

    translate([-command_width/2-12,0,0])
    rotate([0,90,0])
    sphere(d=22.25, $fn=faces_rough*1.5);

    intersection() {
        scale([1.5,1,2.4])
        rotate([90,0,0])
        cylinder(h=12.01, d=30, $fn=6, center=true);

        translate([0,0,20])
        cube (40, center=true);
    }
}

module command_body_minus() {
    translate([20,0,0])
    scale([.25,1,1])
    sphere(d=25, $fn=faces_concave);
    
    translate([-command_width/2-12,0,1.5])
    translate([-20,0,20])
    cube(40, center=true);
    
    translate([-command_width/2-12-12,0,-18])
    scale([2.5,1,1])
    rotate([90,0,0])
    cylinder(r=18, h=50, center=true, $fn=faces_concave);
}


module command_body() {
    difference() {
        command_body_plus();
        command_body_minus();
    }
    
    translate([-command_width/2-12,0,0])
    difference() {
        sphere(d=20, $fn=faces_rough*.75);
        
        translate([0,0,-10]) cube(20, center=true);
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

module command_secondary() {
    command_body();

    util_mirrored([0,1,0]) command_assembly(command_theta);
}


module command_assembly(theta) {
    rotate([-theta,0,0]) {
        hull() {
            translate([-command_width*.75+command_width/5,0,command_width/2-20]) sphere(d=3);

            translate([-command_width*.75-command_width/5,0,command_width/2-20]) sphere(d=3);

            translate([-5,0,0]) sphere(d=3);

            translate([-10,0,0]) sphere(d=3);
        }

        translate([-command_width*.75,0,command_width/2-20])
        rotate([theta,0,0])
        command_nacelle();
    }
}

command_secondary();