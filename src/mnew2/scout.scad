use <../lib/util.scad>;
include <global.scad>;
include <scout_lib.scad>;


module scout_disk() {
    util_saucer_shape(scout_width, scout_height, scout_height, 1, 2);

    translate([0,0,scout_height])
    util_saucer_shape(scout_bridge_w, scout_bridge_h, scout_bridge_h/3, scout_bridge_h, 0);

    translate([0,0,-1])
    util_saucer_shape(scout_bridge_w, scout_bridge_h, 0, scout_bridge_h, scout_bridge_h/3);
}



module scout_body() {
    difference() {
        translate([-scout_body_f, 0, -scout_body_h/2-3])
        util_ovoid(scout_body_f-15, scout_body_b+25, scout_body_w, scout_body_h/2, scout_body_h/2);

        translate([-scout_width/2-scout_body_f-scout_body_b,0,-scout_body_h/2-3])
        cube(scout_width, center=true);

        translate([0,0,-scout_body_h/2-3])
        cube(scout_body_f, center=true);

        translate([-scout_body_f-scout_body_b,0,-3-scout_body_h])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(d=scout_body_h, h=50, center=true, $fn=64);
        
        translate([-scout_body_f/2,0,-3-scout_body_h/2])
        scale([.5,1,1])
        sphere(d=12, $fn=64);
    }

}


module scout_neck() {
    difference() {
        intersection() {
            translate([0,0,-3-scout_body_h])
            util_nacelle(scout_body_f+scout_body_b*.7, scout_body_w*3, 2*scout_body_h+3+3+scout_height, curved=true);

            cube([1000,8,1000],center=true);
        }


        translate([0,0,-scout_body_h/2-13])
        cube(scout_body_f+6, center=true);

        translate([0,0,-500-scout_body_h/2-3])
        cube(1000,center=true);

        translate([0,0,scout_width/2+scout_height+scout_bridge_h])
        cube(scout_width, center=true);
        
        translate([scout_bridge_w/2,0,scout_bridge_w/2])
        cube(scout_bridge_w, center=true);
    }
}

module scout_nacelle() {
    difference() {
        util_ovoid(scout_nacelle_f, scout_nacelle_b, scout_nacelle_w, scout_nacelle_h/2, scout_nacelle_h/2);

        translate([20,0,0])
        sphere(r=10, $fn=64);

        translate([-90,0,0])
        rotate([0,-45,0])
        translate([-50,0,0])
        cube(100, center=true);
    }

    translate([8,0,0])
    sphere(d=10,$fn=64);
}


theta=0;

module scout_assembly(theta=45) {
    util_mirrored([0,1,0])
    rotate([theta,0,0])
    translate([-scout_body_f-scout_nacelle_f*1.5, scout_width/2-scout_nacelle_w*1.5,-3-scout_body_h/2])
    rotate([-theta,0,0])
    scout_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([-scout_body_f-scout_body_b/2 + 20,0,-3-scout_body_h/2])
        sphere(1);

        translate([-scout_body_f-scout_body_b/2 + 10,0,-3-scout_body_h/2])
        sphere(1);

        rotate([theta,0,0])
        translate([-scout_body_f-scout_nacelle_f*1.5-15,scout_width/2-scout_nacelle_w*1.5,-3-scout_body_h/2])
        sphere(1);
        
        rotate([theta,0,0])
        translate([-scout_body_f-scout_nacelle_f*1.5-40,scout_width/2-scout_nacelle_w*1.5,-3-scout_body_h/2])
        sphere(1);
    }
}


module scout(saucer_attached=true) {
    scout_position() {
        scout_disk();
        scout_body();
        scout_neck();
        if (saucer_attached == true) {
            scout_assembly(scout_passive_angle);
        } else {
            scout_assembly(scout_active_angle);
        }
    }
}

scout(saucer_attached=false);