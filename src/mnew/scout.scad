use <../lib/util.scad>;

include <saucer_lib.scad>;
include <scout_lib.scad>;

//use <saucer.scad>;
//saucer_pos();

module sc_body() {
    translate([-sc_disk_width/3, 0, -sc_body_width/2])
    difference() {
        util_ovoid(sc_body_width, sc_body_length, sc_body_width, sc_body_width/2, sc_body_width/2);

        translate([sc_disk_width/3,0,0])
        sphere(sc_disk_width/4, $fn=64);

        translate([-sc_body_length,0, -sc_body_width/2])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder(h=sc_body_width*1.5, r=sc_body_width/2, center=true, $fn=50);

        translate([-sc_body_length+sc_body_width/4,0, sc_body_width/2])
        rotate([90,0,0])
        cylinder(h=sc_body_width*1.5, r=sc_body_width/2, center=true, $fn=6);
    }
}

module sc_disk() {
    difference() {
        union() {
            translate([0,0,-sc_body_width/2])
            util_nacelle(sc_disk_width/3 + sc_body_length - 1.5*sc_body_width/2, sc_body_width*1, sc_body_width/2+sc_disk_height_ext+sc_bridge_height_ext, curved=true);

            translate([0,0,sc_disk_height])
            util_ovoid(sc_bridge_width/2, sc_bridge_width/2, sc_bridge_width, sc_bridge_height_ext, 3);
        }

        translate([0,0,sc_disk_width/2+sc_disk_height+sc_bridge_height])
        cube(sc_disk_width, center=true);
        
        translate([0,0,-sc_disk_width/4])
        cube(sc_disk_width/2, center=true);
    }

    difference() {
        translate([0,0,-1])
                util_ovoid(sc_bridge_width/2, sc_bridge_width/2, sc_bridge_width, 3, sc_bridge_height_ext);

        translate([0,0,-sc_disk_width/2-1-sc_bridge_height])
        cube(sc_disk_width, center=true);
    }

    difference() {
        util_ovoid(sc_disk_width/2, sc_disk_width/2, sc_disk_width, sc_disk_height_ext, 1);

        translate([0,0,sc_disk_width/2 + sc_disk_height])
        cube(sc_disk_width, center=true);
    }
}

module scout_pos(saucer_attached=false) {
    translate([saucer_width/2,0,-3]) {
        sc_disk();
        sc_body();
        if (saucer_attached == true) {
            sc_assembly(0);
        } else {
            sc_assembly(45);
        }
    }
}

module sc_nacelle() {
    difference() {
        util_ovoid(sc_nacelle_f, sc_nacelle_b, sc_nacelle_w, sc_nacelle_h/2, sc_nacelle_h/2);

        translate([sc_nacelle_f,0,0])
        sphere(sc_nacelle_f);

        translate([-sc_nacelle_b-sc_disk_width/2,0,-sc_nacelle_w/2])
        rotate([0,45,0])
        cube(sc_disk_width, center=true);
    }

    sphere(d=sc_nacelle_w*.9, $fn=32);
}


module sc_assembly(theta=45) {
    util_mirrored([0,1,0])
    translate([0,0,-sc_body_width/2]) {
        rotate([theta,0,0]) {
            translate([-sc_disk_width/2-10, sc_disk_width/2-sc_nacelle_w/2, 0])
            rotate([-theta,0,0])
            sc_nacelle();

            hull() {
                translate([-sc_disk_width/2,0,0])
                sphere(1);
                translate([-sc_disk_width/2-7.5,0,0])
                sphere(1);
                    
                translate([-sc_disk_width/2-20,sc_disk_width/2-sc_nacelle_w/2,0])
                sphere(1);
                translate([-sc_disk_width/2-40,sc_disk_width/2-sc_nacelle_w/2,0])
                sphere(1);
            }
        }
    }
}

scout_pos(false);