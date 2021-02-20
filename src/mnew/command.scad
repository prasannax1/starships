use <../lib/util.scad>;
include <command_lib.scad>;
include <transwarp_lib.scad>;
include <global_vars.scad>;


module cm_body() {
    difference() {
        translate([-cm_disk_width/2,0,0])
        util_ovoid(cm_disk_width/2, cm_body_length, cm_body_width, cm_disk_height, cm_body_height);

        translate([cm_disk_width/2.5,0,-cm_disk_width+cm_body_height+5])
        rotate([90,0,0])
        cylinder(r=cm_disk_width, h=cm_body_width, $fn=6, center=true);
        
        translate([-cm_disk_width/2-cm_body_height,0,-cm_body_height-3])
        rotate([90,0,0])
        cylinder(r=cm_body_height, h=cm_body_width*1.5, center=true, $fn=50);

        translate([-cm_disk_width/2-cm_body_height-cm_body_length/2,0,-cm_body_height/2-3])
        cube([cm_body_length, cm_body_width, cm_body_height], center=true);
        
        translate([-cm_disk_width/2-cm_body_length+cm_disk_height/2,0,cm_disk_height*1.25])
        rotate([90,0,0])
        cylinder(r=cm_disk_h_ext, h=cm_body_width, $fn=6, center=true);
    }

    translate([-cm_disk_width/2-cm_body_length+cm_disk_height*1.7,0,0])
    util_ovoid(cm_hangar_width/2, cm_hangar_width/2, cm_hangar_width, cm_hangar_height,2);

}

module cm_disk() {
    difference() {
        util_ovoid(cm_disk_width/2, cm_disk_width/2, cm_disk_width, cm_disk_h_ext, 2);

        translate([0,0,cm_disk_width/2+cm_disk_height])
        cube(cm_disk_width, center=true);
    }



    difference() {
        union() {
            util_nacelle(cm_disk_width/2+cm_body_length/2, cm_body_width*1.5, cm_disk_height+cm_upper_disk_height_ext*1.2, curved=true);

            translate([0,0,cm_disk_height])
            util_ovoid(cm_upper_disk_width/2, cm_upper_disk_width/2, cm_upper_disk_width, cm_upper_disk_height_ext, 3);
        }

        translate([0,0,cm_disk_width/2+cm_disk_height+cm_upper_disk_height])
        cube(cm_disk_width, center=true);
    }

    translate([0,0,cm_disk_height+cm_upper_disk_height])
    rotate(180/cm_bridge_faces)
    util_ovoid(cm_bridge_width/2, cm_bridge_width/2, cm_bridge_width, cm_bridge_height, cm_bridge_height, faces=cm_bridge_faces);

}

module cm_unpos(free=true) {
    cm_disk();
    cm_body();
    if (free == true) {
        util_mirrored([0,1,0]) cm_nacelle_assembly(15);
    } else {
        util_mirrored([0,1,0]) cm_nacelle_assembly(0);
    }
}

module cm_nacelle_assembly(angle) {
    rotate([angle,0,0])
    hull() {
        translate([-cm_disk_width/2, 0,0])
        sphere(3);

        translate([-cm_disk_width/2-cm_nacelle_length/3.2,0,0])
        sphere(3);

        translate([-cm_disk_width/2-cm_nacelle_length/3-cm_nacelle_width/2,cm_disk_width/2-1.2*cm_nacelle_width,0])
        sphere(1);

        translate([-cm_disk_width/2-cm_nacelle_length/3-cm_nacelle_width*1.5,cm_disk_width/2-1.2*cm_nacelle_width,0])
        sphere(1);
    }

    rotate([angle,0,0])
    translate([-cm_disk_width/2-cm_nacelle_length/4,cm_disk_width/2-1.2*cm_nacelle_width,0])
    rotate([-angle,0,0])
    hull()
    util_mirrored([0,1,0])
    translate([0,cm_nacelle_width/6,0])
    util_ovoid(cm_nacelle_length/4, 3*cm_nacelle_length/4, cm_nacelle_width/1.5, cm_nacelle_height-2, 2);
}

module cm_pos() {
    translate([big_disk_width/2,0,engine_rear_height_offset+neck_height+disk_height])
    cm_unpos(free=false);
}

cm_unpos();