use <../lib/util.scad>;
include <global_vars.scad>;
include <transwarp_lib.scad>;

module tw_body() {
    difference() {
        intersection() {
            hull() {
                util_ovoid(engine_front_full,5,engine_width,engine_width/2,engine_width/2);

                translate([0,0,engine_rear_height_offset])
                rotate([0,-90,0])
                translate([0,0,engine_back/2])
                rotate(30)
                cylinder(d1=engine_mid_width, d2=engine_rear_width, h=engine_back, center=true, $fn=6);
            }

            translate([-500+engine_front,0,-engine_height])
            cube([1000,200,200],center=true);
        }

        translate([-engine_front,0,-engine_width/2])
        scale([engine_front/(engine_width/2+engine_rear_height_offset),1,1])
        rotate([90,0,0])
        cylinder(r=engine_width/2+engine_rear_height_offset, h=1.5*engine_width, center=true,$fn=50);

        translate([-250-engine_front,0,-250+engine_rear_height_offset])
        cube(500,center=true);

        translate([engine_front,0,0])
        scale([.25,1,1])
        sphere(deflector_width/2);
        
        translate([-engine_back,0,engine_rear_height_offset])
        rotate([0,-60,0])
        translate([0,0,engine_rear_width*1.2/2])
        cube(engine_rear_width*1.2, center=true);
    }

    translate([engine_front-deflector_width/8,0,0])
    rotate([0,90,0])
    cylinder(r=10,h=3,$fn=32, center=true);
}

module tw_disk() {
    translate([big_disk_width/2, 0, engine_rear_height_offset+neck_height])
    difference() {
        util_saucer(disk_width,disk_width,disk_h_over);

        translate([0,0,200+disk_height])
        cube(400,center=true);
    }

    difference() {
        translate([engine_front,0,engine_rear_height_offset+neck_height])
        scale([1,1,.4])
        rotate([0,90,0])
        cylinder(d=disk_neck_width,h=disk_width*1.1,center=true);

        translate([engine_front,0,engine_rear_height_offset+neck_height+disk_height+250])
        cube(500,center=true);

        translate([engine_front,0,engine_rear_height_offset+neck_height-250-.01])
        cube(500,center=true);
        
        translate([-40,0,engine_rear_height_offset+neck_height])
        rotate([90,0,0])
        cylinder(r=40,h=200,$fn=6,center=true);
    }
}

module tw() {
    tw_disk();
    tw_neck();
    tw_body();
    tw_nacelle_assembly();
}

tw();

module tw_nacelle_assembly() {
    util_mirrored([0,1,0])
    translate([-engine_back/2+25,nacelle_pos_width/2,engine_rear_height_offset+neck_height+disk_height+nacelle_height])
    tw_nacelle();

    translate([-engine_back/2,0,engine_rear_height_offset])
    util_nacelle_bar(nacelle_pos_width, engine_rear_height_offset+neck_height+disk_height+nacelle_height/2, 75, 8);
}


module tw_nacelle() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0,nacelle_width/4,nacelle_height/3])
    util_ovoid(nacelle_front,nacelle_back,nacelle_width/2,nacelle_height/2,nacelle_height/2);

    hull()
    util_mirrored([0,1,0])
    translate([0,nacelle_width/4,nacelle_height/3])
    util_ovoid(nacelle_front,nacelle_back/10,nacelle_width/2,nacelle_height/2+5,5);
}