use <../lib/util.scad>;
include <common.scad>;

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

module command_engine() {
    difference() {
        util_ovoid(command_height, command_height, command_height, 1, command_height*1.25, faces=faces_convex);
            
        translate([command_height*1,0,-command_height/3])
        sphere(d=command_height/3, $fn=faces_concave);
    }

    translate([-command_width*.36,0,-command_height*1.5])
    command_nacelle();
}



command_engine();