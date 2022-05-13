use <../lib/util.scad>;
include <common.scad>;

module sec_body_plus() {
    intersection(){
        util_ovoid(0.82*command_width/2, command_width/2, hex_size, command_height, hex_size/2, faces=faces_convex);

        union() {
            translate([0,0,-command_width/2+.01])
            cube(command_width, center=true);

            translate([-command_width/2+.01,0,0])
            cube(command_width, center=true);

            hex();
        }

    }
}


module sec_body_basic() {
    difference() {
        sec_body_plus();
        sec_body_minus();
    }

    translate([-command_width/2+hex_size/2+2,0,0])
    difference() {
        scale([1,1,.6])
        sphere(d=30, $fn=faces_rough);
        
        translate([0,0,-25+.5])
        cube(50, center=true);
    }
}

module sec_body_nacelle() {
    translate([0,0,command_height*.25])
    nacelle(command_height*.75, command_height*.5, command_width-command_height/2);

    rotate([0,90,0])
    translate([0,0,command_width*.35])
    cylinder(d=command_height, h=command_width*.25, $fn=faces_convex, center=true);
}


module sec_body_assembly(theta) {
    translate([0,0,3])
    rotate([-theta,0,0]) {
        translate([-command_width/2-command_height*2,0,command_width/2-command_height])
        rotate([theta,0,0])
        sec_body_nacelle();

        hull() {
            translate([-command_width/2-command_height*2+15,0,command_width/2-command_height])
            sphere(d=3);

            translate([-command_width/2-command_height*2-15,0,command_width/2-command_height])
            sphere(d=3);

            translate([20,0,0])
            sphere(d=3);

            translate([-50,0,0])
            sphere(d=3);
        }
    }
}

module sec_body_minus() {
    translate([command_width/2,0,0])
    cube([bridge_width, command_width, bridge_width], center=true);

    translate([command_width/2, 0, -hex_size/2])
    scale([2,1,1])
    rotate([90,0,0])
    cylinder(d=hex_size, h=hex_size*2, $fn=faces_concave, center=true);

    translate([-hex_size,0,-hex_size/2])
    rotate([90,0,0])
    cylinder(d=hex_size, h=hex_size*2, $fn=faces_concave, center=true);

    translate([-hex_size,0,0])
    translate([-command_width/2, 0, -command_width/2])
    cube(command_width, center=true);
    
    translate([-command_width/2,0,hex_size/2+1])
    cube(hex_size, center=true);
}

module sec_body() {
    sec_body_basic();
    util_mirrored([0,1,0]) sec_body_assembly(75);
}

sec_body();

