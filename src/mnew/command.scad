use <../lib/util.scad>;

include <saucer_lib.scad>;
include <transwarp_lib.scad>;
include <command_lib.scad>;

//use <transwarp.scad>;
//transwarp();


module cm_disk() {
    difference() {
        util_ovoid(cm_disk_width/2, cm_disk_width/2, cm_disk_width, cm_disk_height_ext, 3);

        translate([0,0,cm_disk_width/2 + cm_disk_height])
        cube(cm_disk_width, center=true);
    }

    difference() {
        union() {
            util_nacelle(cm_disk_width/2 + cm_body_b*.7, cm_body_width*1.2, cm_disk_height_ext*1.5, curved=true);

            translate([0,0,cm_disk_height])
            util_ovoid(cm_upper_disk_width/2, cm_upper_disk_width/2, cm_upper_disk_width, cm_upper_disk_h_e, 3);
        }

        translate([0,0,cm_disk_width/2+cm_disk_height+cm_upper_disk_h])
        cube(cm_disk_width, center=true);
    }

    translate([0,0,cm_disk_height+cm_upper_disk_h])
    rotate(180/cm_bridge_faces)
    util_ovoid(cm_bridge_w/2, cm_bridge_w/2, cm_bridge_w, cm_bridge_h, cm_bridge_h, faces=cm_bridge_faces);
}


module cm_body() {
    difference() {
        translate([-cm_disk_width/2,0,0])
        util_ovoid(cm_body_f, cm_body_b, cm_body_width, cm_body_u, cm_body_d);

        translate([-cm_disk_width/2-cm_body_d,0,-cm_body_d])
        rotate([90,0,0])
        cylinder(r=cm_body_d, h=cm_body_width*1.5, center=true, $fn=50);

        translate([-cm_disk_width-cm_body_d, 0, -cm_disk_width/2])
        cube(cm_disk_width, center=true);

        translate([0,0,-cm_disk_width/5])
        rotate([90,0,0])
        cylinder(h=1.5*cm_body_width, r=.5*cm_disk_width/2, $fn=6, center=true);

        translate([-cm_disk_width/2-cm_body_b+cm_body_u/2,0,cm_body_u])
        rotate([90,0,0])
        cylinder(h=1.5*cm_body_width, r=cm_body_u, $fn=6, center=true);
    }
}

module command_pos(tw_attached=false) {
    translate([saucer_width/2, 0, saucer_height+tw_disk_height-.01]) {
        cm_disk();
        cm_body();
        if (tw_attached == true) {
            cm_assembly(0);
        } else {
            cm_assembly(20);
        }
    }
}

module cm_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,cm_nacelle_w/6,0])
    util_ovoid(cm_nacelle_f, cm_nacelle_b, cm_nacelle_w/1.5, cm_nacelle_u, cm_nacelle_d);
}



module cm_assembly(theta=15) {
    util_mirrored([-0,1,0])
    rotate([theta,0,0]) {
        translate([-cm_nacelle_f-cm_disk_width/2, cm_disk_width/2-cm_nacelle_w,0])
        rotate([-theta,0,0])
        cm_nacelle();

        hull() {
            translate([-cm_disk_width/2+25,0,5])
            sphere(3);

            translate([-cm_disk_width/2-50,0,5])
            sphere(3);

            translate([-cm_disk_width/2-100,cm_disk_width/2-cm_nacelle_w,5])
            sphere(2);

            translate([-cm_disk_width/2-125,cm_disk_width/2-cm_nacelle_w,5])
            sphere(2);
        }
    }
}

command_pos(false);