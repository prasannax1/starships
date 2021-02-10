use <../lib/util.scad>;
include <global_vars.scad>;
include <scout_lib.scad>;
include <saucer_lib.scad>;
include <transwarp_lib.scad>;


module sc_disk() {
    difference() {
        util_saucer(sc_saucer_width, sc_saucer_width, sc_saucer_height_ext);

        translate([0,0,sc_saucer_width/2+sc_saucer_height])
        cube(sc_saucer_width, center=true);
    }
    
    difference() {
        translate([0,0,sc_saucer_height/2])
        scale([1.2,1.2,1])
        sphere(d=sc_body_width);
        
        translate([0,0,-sc_body_width-4])
        cube(sc_body_width*2, center=true);
        
        translate([0,0,sc_body_width+sc_saucer_height+4])
        cube(sc_body_width*2, center=true);
    }
}

module sc_body() {
    difference() {
        util_ovoid(sc_body_length,sc_body_length,sc_body_width,sc_body_width/2,sc_body_width/2);

        translate([sc_body_length/2+sc_body_width/2,0,0])
        cube(sc_body_length,center=true);

        translate([-sc_body_length*1.5+sc_body_width,0,0])
        cube(sc_body_length,center=true);
        
        translate([sc_body_width/2,0,0])
        scale([.2,1,1])
        sphere(d=sc_body_width*.85);
        
        translate([-sc_body_length+sc_body_width,0,-sc_body_width/2])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(r=sc_body_width/2, h=sc_body_width*1.2,center=true);
    }
    
    translate([sc_body_width/2-2,0,0])
    cube(1,center=true);
}

module sc_unpos() {
    sc_disk();

    translate([-sc_saucer_width/3, 0, -sc_body_width/2])
    sc_body();

    sc_neck();
    
    sc_nacelle_assembly();
}

module sc_nacelle() {
    difference() {
        util_ovoid(sc_nacelle_front, sc_nacelle_back, sc_nacelle_width, sc_nacelle_width/2, sc_nacelle_width/2);

        translate([sc_nacelle_front,0,0])
        sphere(sc_nacelle_width*4);

        translate([-sc_nacelle_back,0,-sc_nacelle_width])
        rotate([0,-45,0])
        cube(sc_nacelle_width*4,center=true);
    }

    translate([sc_nacelle_front/2-sc_nacelle_width/2,0,0])
    sphere(d=.8*sc_nacelle_width, $fn=50);
}

sc_pos();

module sc_pos() {
    translate([sc_saucer_width/2+big_disk_width/2,0,engine_rear_height_offset+neck_height-saucer_height-saucer_engine_height])
    sc_unpos();
}


module sc_nacelle_assembly() {
    util_mirrored([0,1,0]) {
        translate([-sc_body_length*1.2, sc_saucer_width/2-sc_nacelle_width*2,sc_saucer_height+4])
        sc_nacelle();

        hull() {
            translate([-sc_saucer_width/2+4,0,-sc_body_width/2])
            sphere(1);

            translate([-sc_saucer_width/2-4,0,-sc_body_width/2])
            sphere(1);

            translate([-sc_body_length*1.2-10, sc_saucer_width/2-sc_nacelle_width*2,sc_saucer_height+4])
            sphere(1);

            translate([-sc_body_length*1.2+10, sc_saucer_width/2-sc_nacelle_width*2,sc_saucer_height+4])
            sphere(1);
        }
    }
}

module sc_neck() {
    difference() {
        translate([0,0,-sc_body_width/2])
        util_nacelle(sc_saucer_width-sc_body_width/2-5, sc_body_width, sc_body_width+4, curved=true);

        translate([0,0,-sc_saucer_width/4])
        cube(sc_saucer_width/2, center=true);
    }
}