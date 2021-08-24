use <../lib/util.scad>;
include <common.scad>;

carrier_saucer_w=250;
carrier_saucer_h=20;

module carrier_plus() {
    intersection() {
    carrier_pos() carrier_basic();

    translate([-saucer_width, 0, -saucer_width/2+.01])
    cube(saucer_width, center=true);
    }
}


module carrier_minus() {
    util_mirrored([0,1,0])
    translate([-saucer_width, saucer_width/2+command_body_width/2, -saucer_width/2 - carrier_body_h])
    cube(saucer_width, center=true);
    
    translate([-saucer_width/2-tw_body_l-command_body_width-(carrier_body_w/2 - carrier_body_h/2), 0, -carrier_body_w/2 - carrier_body_h/2])
    rotate([90,0,0])
    cylinder(r=(carrier_body_w/2 - carrier_body_h/2), h=carrier_body_w*2, center=true, $fn=100);

    translate([-saucer_width/2-tw_body_l-command_body_width-(carrier_body_w/2 - carrier_body_h/2), 0,  - carrier_body_h])
    translate([-saucer_width/2,0,-saucer_width/2])
    cube(saucer_width, center=true);
    
    translate([-saucer_width+carrier_body_l*.27,00])
    cylinder(d=scout_width, h=scout_height*2, center=true);
}


module carrier_saucer() {
    translate([-saucer_width+carrier_body_l*.27,0,-carrier_body_h/2])
    util_saucer_shape(carrier_saucer_w,carrier_saucer_h/2,carrier_saucer_h/2,
    carrier_saucer_h/2,carrier_saucer_h/2);
    
    translate([-saucer_width+carrier_body_l*.27,0,-scout_height])
    bridge_module();
}






module carrier_body() {
    difference() {
        carrier_plus();
        carrier_minus();
    }
}

module carrier_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,10])
    util_ovoid(50,150,20,10,10);
}

module carrier_assembly() {
    util_mirrored([0,1,0])
    translate([-saucer_width+carrier_body_l*.27,carrier_saucer_w/2-10,-carrier_body_h/2])
    carrier_nacelle();
}

module carrier() {
    carrier_body();
    carrier_saucer();
    carrier_assembly();
}

carrier();