use <../lib/util.scad>;
include <common.scad>;


module carrier_body() {
    difference() {
        intersection() {
            body_offset() body_basic();

            translate([-1.3*saucer_width,0,0])
            cube(saucer_width+.01, center=true);
            
            translate([saucer_width/2-1000,0,0])
            cube(saucer_width+.01, center=true);
        }

        util_mirrored([0,1,0])
        translate([-saucer_width/2,saucer_width/2+carrier_body_width/2,-saucer_height-body_width*1.6-carrier_center_offset])
        body_offset()
        cube(saucer_width, center=true);
        
        translate([-body_width*1.2,0,-body_width/2-carrier_center_offset])
        body_offset()
        rotate([90,0,0])
        cylinder(h=body_width*1.5, d=body_width, center=true, $fn=100);

        translate([-body_width*1.2,0,-carrier_center_offset])
        body_offset()
        translate([-saucer_width/2, 0, -saucer_width/2])
        cube(saucer_width, center=true);
    }
}

module carrier_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,carrier_nacelle_h/4])
    util_ovoid(carrier_nacelle_l*.2, carrier_nacelle_l*.8, carrier_nacelle_w,
    carrier_nacelle_h/4,carrier_nacelle_h/4);
}

module carrier_assembly() {
    util_mirrored([0,1,0])
    translate([-carrier_nacelle_l*.9,carrier_nacelle_h, -1.2*carrier_nacelle_h])
    body_offset()
    carrier_nacelle();

    translate([-carrier_nacelle_l*.85,0, -1.2*carrier_nacelle_h])
    body_offset()
    rotate([90,0,0])
    cylinder(h=carrier_nacelle_h*2, d=carrier_nacelle_w, center=true);
}

module carrier_saucer() {
    translate([-100,0,body_width/2])
    body_offset() {
        bridge_module();
        
        translate([-30,0,-24])
        cylinder(h=50, d=50, center=true);
    }
}

module carrier() {
    carrier_body();
    carrier_assembly();
    carrier_saucer();
}

carrier();

