use <../lib/util.scad>;

faces_convex=64;
faces_concave=100;

saucer_width = 750;
saucer_height = 50;
saucer_body_l=250;
saucer_rim=10;
saucer_inner=600;

command_width=180;
command_height=saucer_height/2;
command_body_w=saucer_height;

tw_saucer_width=360;
tw_saucer_height=saucer_height/2;
tw_saucer_inner=150;

carrier_body_w=180;
carrier_body_l=450;
carrier_body_b=300;
carrier_elevation=-40;

wt_f=250;
wt_b=750;
wt_w=120;
wt_h=80;

bridge_width=32;
bridge_height=3;

scout_width=120;
scout_height=10;

escort_w=120;
escort_l=360;
escort_h=20;

module disk_class_1() {
    util_saucer_shape(
        bridge_width,
        bridge_height,
        .5*bridge_height,
        bridge_height,
        .5*bridge_height);
}

module disk_class_2() {
    util_saucer_shape(
        scout_width,
        .75*scout_height,
        .25*scout_height,
        1,1);

    translate([0,0,.75*scout_height])
    disk_class_1();
}

module saucer_basic() {
    hull() {
        translate([0,0,saucer_rim/2])
        cylinder(
            h=saucer_rim, 
            d=saucer_width, 
            center=true,
            $fn=faces_convex);

        translate([0,0,saucer_height/2])
        cylinder(
            h=saucer_height,
            d=saucer_inner,
            center=true,
            $fn=faces_convex);
    }
}

module body_pos() {
    translate([-saucer_width/2, 0, carrier_elevation])
    children();
}

module body_basic() {
    intersection() {
        util_ovoid(
            5,
            carrier_body_l +
            carrier_body_b, 
            carrier_body_w, 
            carrier_body_w/2, 
            carrier_body_w/2, 
            faces=faces_convex);
            
        translate([-carrier_body_l/2,0,carrier_elevation])
        cube(carrier_body_l+2, center=true);
    }
}

module saucer_body_basic() {
    util_ovoid(
        saucer_body_l,
        5, 
        carrier_body_w, 
        carrier_body_w/2, 
        carrier_body_w/2, 
        faces=faces_convex);
}

module nacelle_pos() {
    util_mirrored([0,1,0])
    translate([-saucer_width/2-carrier_body_l/4-wt_f,saucer_width/2-wt_w,saucer_height+tw_saucer_height])
    children();
}

module nacelle_basic() {
    util_ovoid(wt_f, wt_b, wt_w, wt_h/2, wt_h/2);
}

module tw_saucer_pos() {    
    translate([0,0,saucer_height+tw_saucer_height/2-.01])
    children();
}

module tw_saucer_basic() {
    cylinder(
        d1=tw_saucer_width+tw_saucer_height, 
        d2=tw_saucer_width-tw_saucer_height,
        h=tw_saucer_height,
        center=true,
        $fn=faces_convex);
}

module demo(){
    saucer_basic();
    body_pos() body_basic();
    body_pos() saucer_body_basic();

    nacelle_pos() nacelle_basic();
    tw_saucer_pos() tw_saucer_basic();
}

//demo();