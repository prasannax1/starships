use <../lib/util.scad>;
include <common.scad>;


module saucer_disk() {
    hull() {
        translate([0,0,-saucer_height+5])
        cylinder(d=saucer_width, h=10, $fn=faces_concave, center=true);

        translate([0,0,-5])
        cylinder(d=saucer_width-4*saucer_height, h=10, $fn=faces_concave, center=true);
    }

    disk_class_2();
    
    difference() {
        cylinder(d=400, h=6, $fn=faces_concave, center=true);
        cylinder(d=400-50, h=10, $fn=faces_concave, center=true);
        
        util_mirrored([0,1,0])
        scale([1,1,1])
        rotate(50)
        translate([-saucer_width/2, saucer_width/2, 0])
        cube(saucer_width, center=true);
    }

    util_mirrored([0,1,0])
    rotate(50)
    translate([-200+25/2,0,0])
    cylinder(d=25, h=6, $fn=faces_convex, center=true);
}




module saucer_body_plus() {
    translate([-400+saucer_width/2,0,-saucer_height/2])
    translate([-200,0,0])
    cube([400, max(carrier_width,tw_lower_d), saucer_height], center=true);


    intersection() {
        hull() {
            translate([-saucer_width,0,-saucer_height-tw_disk_h/2+.01])
            cylinder(h=tw_disk_h, d1=tw_upper_d, d2=tw_lower_d, $fn=faces_convex, center=true);

            translate([0,0,-saucer_height-tw_disk_h/2+.01])
            cylinder(h=tw_disk_h, d1=tw_upper_d, d2=tw_lower_d, $fn=faces_convex, center=true);
        }

        translate([-400+saucer_width/2,0,-saucer_height/2])
        cube([800, max(carrier_width,tw_lower_d), saucer_height*4], center=true);
    }
}

module saucer_body_minus() {
    translate([0,0,-saucer_height-tw_disk_h])
    cylinder(d=scout_width-2, h=20, $fn=faces_concave, center=true);

    translate([-400,0, -saucer_height-tw_disk_h])
    cube([800, scout_width-2, 20], center=true);
    
    translate([326-saucer_width,0,-saucer_height-5]) {
        cube([5,100,10], center=true);
        
        util_mirrored([0,1,0])
        translate([0,50,0])
        rotate([0,90,0])
        cylinder(d=10, h=5, $fn=faces_concave, center=true);
    }
    
    util_repeat(3, [60,0,0])
    util_mirrored([0,1,0])
    translate([-saucer_width/4-110,(tw_upper_d+tw_lower_d)/4, -saucer_height -5-.5])
    cube([40,50,10], center=true);
}

        

module saucer_nacelle() {
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

module saucer_assembly() {
    util_mirrored([0,1,0]) {
        translate([-saucer_width/2, tw_lower_d/2-12, -saucer_height-50]) saucer_nacelle();

        translate([-saucer_width/2, tw_lower_d/2-12, -saucer_height])
        cube([50,15,100], center=true);
    }
}

module saucer_body() {
    difference() {
        saucer_body_plus();
        saucer_body_minus();
    }
}

module saucer() {
    saucer_disk();
    saucer_body();
    saucer_assembly();
}

saucer();
