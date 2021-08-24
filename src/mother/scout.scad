use <../lib/util.scad>;
include <common.scad>;


scout_body_width=22;
scout_body_f=15;
scout_body_f_ext=15;

scout_body_b=75;
scout_body_b_ext=25;

scout_neck_width=8;

scout_nacelle_w=16;
scout_nacelle_f=20;
scout_nacelle_b=110;

module scout_saucer() {
    bridge_module();

    translate([0,0,-1])
    util_saucer_shape(bridge_width, bridge_height, bridge_height, bridge_height, bridge_height);
}
module scout_neck() {
    difference() {
        translate([0,0,-bridge_height-scout_body_width/2])
        scale([3.55,1,1])
        rotate([90,0,0])
        cylinder(r=scout_body_width/2+bridge_height*2+scout_height*.75, h=scout_neck_width, $fn=100, center=true);

        translate([saucer_width/2,0,0])
        cube(saucer_width, center=true);

        translate([0,0,-saucer_width/2-bridge_height-scout_body_width/2])
        cube(saucer_width, center=true);

        translate([saucer_width/2-scout_width/3.6,0,-saucer_width/2])
        cube(saucer_width, center=true);
    }
}

module scout_body_plus() {
    translate([-scout_width/3,0,-scout_body_width/2-bridge_height-1])
    intersection() {
        translate([scout_body_f,0,0])
        translate([-(scout_body_f+scout_body_b)/2,0,0])
        cube(scout_body_f+scout_body_b, center=true);
        util_ovoid(scout_body_f+scout_body_f_ext, scout_body_b+scout_body_b_ext, scout_body_width, scout_body_width/2, scout_body_width/2);
    }
}


module scout_body_minus() {
    translate([-scout_width/4.8,0,-scout_body_width/2-bridge_height-1])
    scale([.25,1,1])
    sphere(d=15, $fn=100);
    
    translate([-scout_width/3-scout_body_b,0,-scout_body_width-bridge_height-2.5])
    scale([2.5,1,1])
    rotate([90,0,0])
    cylinder(d=scout_body_width, h=scout_body_width*2, $fn=100, center=true);
}

module scout_nacelle() {
    difference() {
        util_ovoid(scout_nacelle_f, scout_nacelle_b, scout_nacelle_w, scout_nacelle_w/2, scout_nacelle_w/2);

        translate([scout_nacelle_f*.9,0,0])
        sphere(d=scout_nacelle_w, $fn=100);

        translate([-scout_nacelle_b*.9,0,0])
        rotate([0,-45,0])
        translate([-saucer_width/2,0,0])
        cube(saucer_width, center=true);
    }

    translate([scout_nacelle_f*.35,0,0])
    sphere(d=scout_nacelle_w*.9, $fn=64);
}


module scout_assembly(theta=0) {
    translate([0,0,-scout_body_width/2-bridge_height-1])
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        hull() {
            translate([-scout_width*.75-20, scout_width/2-scout_nacelle_w,0])
            sphere(1.2);

            translate([-scout_width*.75-50, scout_width/2-scout_nacelle_w,0])
            sphere(1.2);

            translate([-scout_width*.5, 0,0])
            sphere(1.5);
            
            translate([-scout_width*.5-7.5, 0,0])
            sphere(1.5);
        }



        translate([-scout_width*.75, scout_width/2-scout_nacelle_w,0])
        rotate([-theta,0,0])
        scout_nacelle();
    }
}

module scout_body() {
    difference() {
        scout_body_plus();
        scout_body_minus();
    }
}

module scout(saucer_attached=true) {
    translate([0,0,-scout_height]) {
        scout_saucer();
        scout_body();
        render() scout_neck();
        if (saucer_attached == true) {
            scout_assembly(22);
        } else {
            scout_assembly(45);
        }
    }
}

scout(false);