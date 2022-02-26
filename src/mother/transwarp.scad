use <../lib/util.scad>;
include <common.scad>;


module tw_disk_single() {
    translate([0,0,tw_disk_h/2-.01])
    cylinder(d1=tw_lower_d, d2=tw_upper_d, h=tw_disk_h, $fn=faces_convex, center=true);
}

module tw_double() {
    saucer_pos() children();
    translate([-100,0,0]) children();
}

module tw_body() {
    difference() {
        hull() tw_double() tw_disk_single();
            
        saucer_pos()
        cylinder(h=tw_disk_h*4, d=(tw_upper_d+scout_width)/2, $fn=faces_concave, center=true);


        hull() tw_double() cylinder(d=command_body_width, h=tw_disk_h*4, $fn=faces_concave, center=true);
    }

    difference() {
        intersection() {
            translate([-100-tw_upper_d/2,0,0])
            scale([5,1,1])
            rotate([90,0,0])
            cylinder(r=tw_disk_h, h=75, $fn=faces_convex, center=true);

            translate([-160,0,0])
            translate([-150,0,150])
            cube(300, center=true);
        }

        translate([-350,0,15])
        cube([100,50,10], center=true);
    }
}

module tw_disk() {
    translate([-100,0,tw_disk_h-.02])
    disk_class_2();
}

module transwarp() {
    tw_disk();
    tw_body();
    tw_assembly();
}

module tw_assembly() {
    util_mirrored([0,1,0]) {
        translate([-150,tw_lower_d/2-12,-saucer_height])
        tw_nacelle();

        translate([-100,tw_lower_d/2-12,-saucer_height/2])
        cube([50,10,56], center=true);
    }
}

module tw_nacelle() {
    translate([-100,0,0])
    difference() {
        union() {
            util_mirrored([0,0,1])
            util_mirrored([1,0,0])
            translate([200,0,12])
            sphere(d=24, $fn=faces_convex);

            cube([400,24,24], center=true);

            util_mirrored([0,0,1])
            translate([0,0,12])
            rotate([0,90,0])
            cylinder(d=24, h=400, $fn=faces_convex, center=true);

            util_mirrored([1,0,0])
            translate([200,0,0])
            cylinder(d=24,h=24,$fn=faces_convex, center=true);
        }

        util_mirrored([0,1,0])
        translate([0,12,0])
        rotate([0,90,0])
        cylinder(h=360,d=5,$fn=faces_concave,center=true);
    }
}

transwarp();