use <../lib/util.scad>;
include <common.scad>;

hangar_height = 2*carrier_elevation;
carrier_saucer_w = 250;
carrier_saucer_h = 25;

module carrier_saucer() {
    intersection() {
        translate([-saucer_width/2-carrier_body_l/5,0,carrier_elevation])
        util_saucer_shape(
            carrier_saucer_w,
            carrier_saucer_h/2,
            carrier_saucer_h/4,
            carrier_saucer_h/2,
            carrier_saucer_h/4);

        translate([-saucer_width/2-carrier_body_l/2,0,carrier_elevation])
        cube(carrier_body_l, center=true);
    }
}

module carrier_body() {
    difference() {
        body_pos() body_basic();

        translate([-saucer_width/2-carrier_body_l/2,0,saucer_width/2-.01])
        cube(saucer_width, center=true);
        
        util_mirrored([0,1,0])
        translate([-saucer_width/2-carrier_body_l/2, command_body_w/2, hangar_height])
        translate([0,saucer_width/2,-saucer_width/2])
        cube(saucer_width, center=true);
        
        translate([-saucer_width/2-carrier_body_w-hangar_height,0,+carrier_elevation-carrier_body_w/2])
        rotate([90,0,0])
        cylinder(
            d=carrier_body_w+hangar_height,
            h=500, center=true, $fn=faces_concave);

        translate([-saucer_width/2-carrier_body_w-hangar_height,0,+carrier_elevation-carrier_body_w/2+(carrier_body_w+hangar_height)/2])
        translate([-saucer_width/2,0,-saucer_width/2])
        cube(saucer_width, center=true);
    }
}

module carrier_assembly() {
    util_mirrored([0,1,0])
    translate([-saucer_width/2-carrier_body_l/5,carrier_saucer_w/2-20,carrier_elevation])
    hull()
    util_mirrored([0,0,1])
    translate([0,0,10])
    util_ovoid(carrier_body_l/5, carrier_body_l/2, 20, 10,10);
}


module carrier() {
    carrier_saucer();
    carrier_body();
    carrier_assembly();
}

carrier();

