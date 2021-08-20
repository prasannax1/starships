use <../lib/util.scad>;
include <common.scad>;


module scout_saucer() {
    bridge_module();

    translate([0,0,-1])
    util_saucer_shape(bridge_width, 1,1, bridge_height, 1);
    
    translate([-scout_width/4,0,scout_height/2])
    cube([scout_width/2, bridge_width/2, scout_height-.01], center=true);
}

module scout(saucer_attached=true) {
    scout_pos() {
        scout_saucer();
        scout_body();
        if (saucer_attached == true) {
            scout_assembly(15);
        } else {
            scout_assembly(45);
        }
    }
}

module scout_pos() {
    translate([0,0,-saucer_height/2-scout_height+.01])
    children();
}

scout(saucer_attached=false);

module scout_assembly(theta) {
    translate([0,0,-scout_body_w/2-10])
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-scout_width/2-scout_nacelle_f-10,scout_width/2-scout_nacelle_w/2,0])
        rotate([-theta,0,0])
        scout_nacelle();

        hull() {
            translate([-scout_width/2-scout_nacelle_f-20,scout_width/2-scout_nacelle_w/2,0])
            sphere(2);

            translate([-scout_width/2-5,0,0])
            sphere(2);

            translate([-scout_width/2-17,0,0])
            sphere(2);
            
            translate([-scout_width/2-scout_nacelle_f-44,scout_width/2-scout_nacelle_w/2,0])
            sphere(2);
        }
    }

}


module scout_nacelle() {
    difference() {
        util_ovoid(scout_nacelle_f, scout_nacelle_b, scout_nacelle_w, scout_nacelle_w/2, scout_nacelle_w/2);

        translate([-scout_nacelle_b+10,0,0])
        rotate([0,-45,0])
        translate([-scout_width/2,0,0])
        cube(scout_width, center=true);

        translate([scout_nacelle_f-2.5,0,0])
        sphere(d=scout_nacelle_w, $fn=100);
    }

    translate([scout_nacelle_f-11,0,0])
    sphere(d=scout_nacelle_w*.75, $fn=64);
}

module scout_body() {
    difference() {
        intersection() {
            translate([-scout_width/2+10,0,-scout_body_w/2-10])
            util_ovoid(scout_body_f, scout_body_b, scout_body_w, scout_body_w/2, scout_body_w/2);

            translate([-0.7*scout_width+5,0,-0.75*scout_width/2])
            cube(0.7*scout_width, center=true);
        }

        translate([-scout_width/2+scout_body_f+2.2,0,-scout_body_w/2-10])
        scale([.5,1,1])
        sphere(d=15);
        
        translate([-scout_width/2-scout_body_b/2-10,0,-scout_body_w-11])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder($fn=100, h=scout_body_w, d=scout_body_w, center=true);
    }



    hull() {
        translate([-scout_width/2+9,0,-scout_body_w/2-10])
        sphere(d=8);
        
            translate([-scout_width/2,0,-scout_body_w/2-10])
        sphere(d=8);

        translate([-scout_width/2+7.5,0,5])
        sphere(d=8);

        translate([-scout_width/3.75,0,5])
        sphere(d=8);
    }
}