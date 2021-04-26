use <../lib/util.scad>;
saucer_width=750;
saucer_upper_width=550;
saucer_height=50;
saucer_body_length=180;
body_width=180 ;
body_height=180;
body_length=400;
body_back=280;
nacelle_length=800;
nacelle_front=350;
nacelle_back=800-nacelle_front;
escort_width=100;
escort_height=20;
command_width=200;
command_body_length=100;
scout_width=100;
transwarp_disk_w=300;
transwarp_disk_hole=150;
transwarp_h=saucer_height*1.5;

cr_rear_curve = body_height/4 - escort_height;

module escort_position() {
    translate([-body_length-escort_width/2-cr_rear_curve,0,-escort_height/2])
    children();
}


module saucer_basic(rim_height=10) {
    translate([0,0,rim_height/2])
    cylinder(d=saucer_width, h=rim_height, center=true, $fn=64);

    translate([0,0,saucer_height-rim_height/2])
    cylinder(d=saucer_upper_width, h=rim_height, center=true, $fn=64);
}



saucer_pos_x=saucer_width/2;
saucer_pos_y=0;
saucer_pos_z=0;

module saucer_position() {
    translate([saucer_pos_x, saucer_pos_y, saucer_pos_z])
    children();
}


module command_position() {
    translate([0,0,saucer_height*1.5])
    saucer_position()
    children();
}

module scout_position() {
    translate([0,-0,-10])
    saucer_position()
    children();
}

body_pos_x=-body_length;
body_pos_y=0;
body_pos_z=-body_height/4;

module body_basic() {
    util_ovoid(saucer_body_length + body_length/2 + body_length/2, body_back, body_width, body_height/2, body_height/2, faces=64);
}

module body_position() {
    translate([body_pos_x, body_pos_y, body_pos_z])
    children();
}


module tw_body_hexagon() {
    translate([40,0,0])
    scale([1.5,1,1.5])
    rotate([90,0,0])
    cylinder(r=100, h=500, $fn=6, center=true);
}

transwarp_pos_x=saucer_width/2;
transwarp_pos_y=0;
transwarp_pos_z=0;

module transwarp_position() {
    translate([transwarp_pos_x, transwarp_pos_y, transwarp_pos_z])
    children();
}

module transwarp_basic() {
    translate([-saucer_width/3,0,0])
    scale([(saucer_width/2+body_length)/(4*transwarp_h/3), 1,1.01]) {
        translate([transwarp_h/6,0,transwarp_h/2])
        cube([transwarp_h/3, 500, transwarp_h], center=true);

        translate([0,0,2*transwarp_h/3])
        rotate([90,0,0])
        cylinder(h=500, r=transwarp_h/3, center=true, $fn=64);

        difference() {
            translate([-transwarp_h/6,0,transwarp_h/3])
            cube([transwarp_h, 500, 2*transwarp_h/3], center=true);

            translate([-2*transwarp_h/3,0,2*transwarp_h/3])
            rotate([90,0,0])
            cylinder(h=550, r=transwarp_h/3, center=true, $fn=64);
        }

        translate([-transwarp_h/3,0,transwarp_h/6])
        cube([4*transwarp_h/3, 500, transwarp_h/3], center=true);
    }
}



module nacelle_shape() {
    translate([nacelle_front/2,0,0])
    cube([nacelle_front, 100,100], center=true);
    
    translate([-nacelle_back/2,0,0])
    cube([nacelle_back,80,80], center=true);
}

nacelle_pos_x=-500;
nacelle_pos_y=250;
nacelle_pos_z=78;

module nacelle_position() {
    translate([nacelle_pos_x, nacelle_pos_y, nacelle_pos_z])
    children();
}

//show_primitives();

module show_primitives() {
    saucer_position()
    saucer_basic(10);
    
    body_position()
    body_basic();

    transwarp_position()
    transwarp_basic();
    
    util_mirrored([0,1,0])
    nacelle_position()
    nacelle_shape();
    
    tw_body_hexagon();
}