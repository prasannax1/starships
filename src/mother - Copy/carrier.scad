use <../lib/util.scad>;
include <common.scad>;

module carr_plane_basic() {
    util_mirrored([1,0,0])
    translate([carrier_width*2-hangar_width/2,0,0])
    rotate_extrude(angle=360, $fn=faces_convex)
    translate([hangar_width/2,0,0])
    circle(d=20, $fn=faces_rough);

    util_mirrored([0,1,0])
    translate([0,hangar_width/2,0])
    rotate([0,90,0])
    cylinder(d=20, h=carrier_width*4-hangar_width, $fn=faces_rough, center=true);

    util_mirrored([1,0,0])
    translate([carrier_width*2-hangar_width/2,0,0])
    cylinder(d=hangar_width, h=20, center=true, $fn=faces_convex);

    cube([carrier_width*4-hangar_width, hangar_width, 20], center=true);
}
 

module carr_lower_shape() {
    intersection() {
        union() {
            rotate([90,0,0])
            cylinder(h=hangar_width+20, r=carrier_width*2-hangar_width/2, $fn=faces_concave, center=true);

            rotate([-90,0,0])
            rotate_extrude(angle=180, $fn=faces_concave)
            translate([carrier_width*2-hangar_width/2,0,0])
            circle(d=hangar_width+20, $fn=faces_convex);  
        }

        translate([0,0,-5/2*carrier_width])
        cube(5*carrier_width, center=true);
    }
}


module carr_body_basic() {
    carr_plane_basic();

    difference() {
        scale([1,1,.3])
        carr_lower_shape();

        hull() {
            translate([-hangar_height,0, -hangar_height/2])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=carrier_width, $fn=faces_concave, center=true);

            translate([hangar_height/2,0, -carrier_width+.02])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=carrier_width, $fn=faces_concave, center=true);

            translate([-3*carrier_width,0, -hangar_height/2+.02])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=carrier_width, $fn=faces_concave, center=true);
        }
    }
}

module carr_bar() {
    translate([0,0,hangar_width/2])
    rotate([90,0,0]) {
        util_mirrored([0,1,0])
        util_mirrored([1,0,0])
        translate([hangar_width/2-20-.01, hangar_width/2-20-.01, 0])
        rotate_extrude(angle=90, $fn=faces_convex)
        translate([20,0,0])
        circle(d=20, $fn=faces_rough);

        util_mirrored([1,0,0])
        translate([hangar_width/2-.01,0,0])
        rotate([90,0,0])
        cylinder(d=20, h=hangar_width-40, $fn=faces_rough, center=true);

        util_mirrored([0,1,0])
        translate([0, hangar_width/2-.01,0])
        rotate([0,90,0])
        cylinder(d=20, h=hangar_width-40, $fn=faces_rough, center=true);
        
        difference() {
            cube([hangar_width, hangar_width, 10], center=true);
            cylinder(d=hangar_width/2, h=30, center=true, $fn=faces_rough);
        }
        
        rotate_extrude(angle=360, $fn=faces_convex)
        translate([hangar_width/4,0,0])
        circle(d=10, $fn=faces_rough);
    }
}

module carr_bar_box() {
    intersection() {
        cube([hangar_width/2, 30, 30], center=true);
        rotate([0,90,0])
        cylinder(d=50, h=hangar_width/2+20, $fn=4, center=true);
    }
}

theta = 60;

module carr_assembly(theta) {
    translate([0,30,0]) {
        rotate([-theta,0,0]) {
            carr_bar();
            translate([0,0,hangar_width]) 
            rotate([theta,0,0]) carr_bar_box();
        }

        carr_bar_box();
        translate([0,-30+.01,0]) carr_bar_box();
    }
}

module carrier() {
    util_mirrored([0,1,0])
    translate([-carrier_width/2-40, hangar_width/2,0])
    carr_assembly(carrier_theta);
    
    util_mirrored([0,1,0])
    translate([0,30-.01,-25])
    warp_pos(carrier_theta)
    nacelle(30, 20, carrier_width);
    
    carr_body();
}




module carr_body() {
    difference() {
        carr_body_basic();

        translate([-carrier_width/2,0,-hangar_height/2+.01])
        rear_hangar_minus();
        
        translate([2*carrier_width,0,-hangar_height/2])
        rotate([0,90,0])
        cylinder(d=hangar_height, h=carrier_width, $fn=faces_concave, center=true);
    }

    intersection() {
        translate([-48,0,0])
        rotate([0,-30,0])
        translate([carrier_width,0,0])
        cube([2*carrier_width, hangar_width+10, 2*carrier_width], center=true);

        translate([0,0,-hangar_height/2-2.5])
        cube([carrier_width, hangar_width+5, hangar_height+5], center=true);
    }

    intersection() {
        scale([1.02,1,.25])
        rotate([90,0,0])
        cylinder(d=4*carrier_width-50, h=hangar_width, $fn=faces_convex, center=true);

        translate([2*carrier_width, 0, -hangar_height/2])
        rotate([0,90,0])
        cylinder(d=hangar_height+10, h=carrier_width+20, center=true, $fn=faces_rough);
    }
    
    translate([1.6*carrier_width,0,25-.005])
    cylinder(d=hangar_width, h=30, $fn=faces_convex, center=true);
}

module rear_hangar_minus() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0,hangar_width/2-5, hangar_height/2-5])
    rotate([0,90,0])
    cylinder(h=carrier_width, d=10, $fn=faces_rough, center=true);

    translate([-carrier_width/2,0,hangar_height/2-5])
    rotate(90)
    rotate_extrude(angle=180,  $fn=faces_convex)
    translate([hangar_width/2-5,0,0])
    circle(d=10, $fn=faces_rough);

    translate([-carrier_width/2,0,hangar_height/2-5])
    cylinder(d=hangar_width-10, h=10, center=true, $fn=faces_convex);

    translate([-carrier_width/2,0,0])
    cylinder(d=hangar_width, h=hangar_height-10, center=true, $fn=faces_convex);
}

carrier();