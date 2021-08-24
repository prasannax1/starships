use <../lib/util.scad>;
saucer_width=750;
saucer_height=50;
saucer_rim_h=10;
saucer_inner=600;
saucer_body_l=270;

command_width=200;
command_height=saucer_height/2;
command_body_width=saucer_height;

scout_width=120;
scout_height=10;

bridge_width=32;
bridge_height=3;

tw_saucer_width=360;
tw_saucer_inner=180;
tw_saucer_height=saucer_height/2;

tw_body_w=180;
tw_body_l=150;

taper_factor=0.9;

saucer_body_w=taper_factor*tw_body_w;

carrier_body_l = 360;
carrier_body_l_ext=200;
carrier_body_w=tw_body_w;

carrier_body_h = 80;

escort_width=120;
escort_length=240;
escort_height=18;

smoothness=64;

module bridge_module() {
    util_saucer_shape(scout_width, scout_height*.75, scout_height*.25, 1,1); 

    translate([0,0,.75*scout_height])
    util_saucer_shape(bridge_width, bridge_height, bridge_height, 1,1);
}

module saucer_basic(){
    hull() {
        translate([0,0,saucer_rim_h/2])
        cylinder(d=saucer_width, h=saucer_rim_h, center=true, $fn=smoothness);

        translate([0,0,saucer_height/2])
        cylinder(d=saucer_inner, h=saucer_height, center=true, $fn=smoothness);
    }
}

module demo() {
    saucer_basic();
    saucer_body_pos() saucer_body_basic();
    body_pos() body_basic();
    tw_saucer_pos() tw_saucer_basic();
    carrier_pos() carrier_basic();
}

module saucer_body_pos() {
    translate([-saucer_width/2, 0, -(tw_body_w/2 - saucer_height)])
    children();
}

module saucer_body_basic() {
    util_ovoid(saucer_body_l, 5, saucer_body_w, saucer_body_w/2, saucer_body_w/2, faces=smoothness);
}


module body_pos() {
    translate([-saucer_width/2-tw_body_l/2,0,-(tw_body_w/2 - saucer_height)])
    children();
}

module body_basic() {
    hull() {
        sphere(d=tw_body_w, $fn=smoothness);

        rotate([0,90,0])
        cylinder(h=tw_body_l+.02, d1=carrier_body_w, d2=saucer_body_w, $fn=smoothness, center=true);
    }
}

module tw_saucer_pos() {
    translate([0,0,tw_saucer_height/2+saucer_height]) children();
    
    translate([-saucer_width/2.5,0,tw_saucer_height/2+saucer_height]) children();
}

module tw_saucer_basic() {
    cylinder(d1=(tw_saucer_width+tw_saucer_height), d2=(tw_saucer_width-tw_saucer_height), h=tw_saucer_height+.02, center=true, $fn=smoothness);
}

module carrier_pos() {
    translate([-saucer_width/2-tw_body_l, 0, -(tw_body_w/2 - saucer_height)])
    children();
}

module carrier_basic() {
    intersection() {
        util_ovoid(5,carrier_body_l+carrier_body_l_ext, carrier_body_w, carrier_body_w/2, carrier_body_w/2, faces=smoothness);

        translate([-carrier_body_l/2,0,0])
        cube(carrier_body_l, center=true);
    }
}