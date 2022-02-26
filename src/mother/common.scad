use <../lib/util.scad>;

faces_convex=64;
faces_concave=100;

carrier_front=200;
carrier_front_ext=50;
carrier_back=400;
carrier_back_ext=105;
carrier_width=250;
carrier_height=240;
carrier_hangar_height=100;
carrier_hangar_width=200;
carrier_hangar_offset=10;
carrier_nacelle_length=400;
carrier_nacelle_bar_length=333;

bridge_width=32;
scout_width=120;
scout_theta=45;

warp_length=900;
warp_height=80;
warp_hangar_length=800;
warp_hangar_width=125;
warp_theta=60;
warp_nacelle_height=150;

saucer_width=750;
saucer_height=50;

tw_lower_d=300;
tw_upper_d=200;
tw_disk_h=30;

command_width=180;
command_body_width=40;
command_saucer_height=10;
command_body_length=command_width;
command_theta=15;

module body_basic() {
    util_ovoid(
        carrier_front + carrier_front_ext,
        carrier_back + carrier_back_ext,
        carrier_width,
        carrier_height/2,
        carrier_height/2,
        faces=faces_convex);
}

module disk_class_1() {
    difference() {
        intersection() {
            scale([1,1,.3])
            sphere(d=bridge_width, $fn=faces_convex);

            cube([bridge_width*1.5,bridge_width*1.5,7], center=true);
        }
        
        translate([0,0,7/2])
        cylinder(d=bridge_width*.6, h=.2, $fn=faces_concave, center=true);
    }
}

module disk_class_2() {
    difference() {
        intersection() {
            scale([1,1,.2])
            sphere(d=scout_width, $fn=faces_convex);

            translate([0,0,scout_width*1.5/2-.01])
            cube(scout_width*1.5, center=true);
        }

        translate([0,0,scout_width*1.5/2+7])
        cube(scout_width*1.5, center=true);
        
        translate([0,0,3.5])
        cube([scout_width*1.5,scout_width*1.5,.2], center=true);
    }

    translate([0,0,3.5])
    cylinder(h=6, d1=scout_width*.97, d2=scout_width*.8,center=true);

    translate([0,0,7])
    disk_class_1();
}

module disk_class_3() {
    difference() {
        intersection() {
            scale([1,1,.2])
            sphere(d=command_width, $fn=faces_convex);
            
            translate([0,0,250-.01])
            cube(500, center=true);
        }
        
        translate([0,0,250+command_saucer_height])
        cube(500, center=true);
    }
    
    translate([0,0,command_saucer_height-.01])
    disk_class_2();
}

module warp_pos() {
    util_mirrored([0,1,0])
    translate([-400,carrier_width/2-24,-12])
    rotate([-warp_theta,0,0])
    translate([0,0,warp_nacelle_height])
    rotate([warp_theta,0,0])
    children();
}

module carrier_pos() {
    translate([-200+.01,0,0])
    children();
}

module saucer_pos() {
    translate([800-saucer_width/2-.01,0,0])
    children();
}

module final_warp_pos() {
    util_mirrored([0,1,0])
    translate([warp_hangar_width*1.5,0,0])
    warp_pos(warp_theta)
    children();
}

module tw_pos() {
    translate([200,0,100+50])
    children();
}

module command_pos() {
    translate([0,0,tw_disk_h-.5])
    saucer_pos()
    children();
}

module escort_pos() {
    translate([-350,0,-carrier_hangar_height-2*carrier_hangar_offset])
    children();
}

module scout_pos() {
    saucer_pos() translate([0,0,-1-saucer_height-tw_disk_h+.05])
    children();
}