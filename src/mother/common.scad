use <../lib/util.scad>;
saucer_width=750;
saucer_height=60;
saucer_nacelle_w=25;
saucer_nacelle_h=50;
saucer_nacelle_l=200;

tw_saucer_width=350;
tw_saucer_height=30;
tw_saucer_inner=180;

tw_nacelle_f=250;
tw_nacelle_b=750;
tw_nacelle_h=75;
tw_nacelle_u_w=90;
tw_nacelle_l_w=120;
tw_nacelle_theta=45;

body_length_f=270;
body_length_b=500;
body_width=200;
body_length_b_ext=200;
body_pos_x_offset=120;

command_saucer_width=250;
command_body_width=saucer_height;
command_nacelle_f=50;
command_nacelle_b=200;
command_nacelle_w=30;
command_nacelle_h=20;

carrier_body_width=50;
carrier_nacelle_w=25;
carrier_nacelle_h=50;
carrier_nacelle_l=150;
carrier_center_offset=25;

scout_width=120;
scout_height=10;

scout_body_f=20;
scout_body_b=100;
scout_body_w=24;
scout_nacelle_w=15;
scout_nacelle_f=20;
scout_nacelle_b=120;

bridge_width=32;
bridge_height=3;

module bridge_module() {
    util_saucer_shape(scout_width, scout_height*.75, scout_height*.25,1,1);
    
    translate([0,0,scout_height*.75])
    util_saucer_shape(bridge_width, bridge_height,  1, 1,1);
}

module body_offset() {
    translate([-saucer_width/2-body_pos_x_offset,0,-body_width/2-saucer_height/2])
    children();
}

module body_basic() {
    util_ovoid(body_length_f, body_length_b+body_length_b_ext, body_width, body_width/2, body_width/2, faces=64);
}


module saucer_basic() {
    hull() {
        cylinder(d=saucer_width, h=saucer_height/2, center=true, $fn=64);
        cylinder(d=saucer_width/1.2, h=saucer_height, center=true, $fn=64);
    }
}

module saucer_offset() {
    translate([0,0,0]) children();
}