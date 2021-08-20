use <../lib/util.scad>;
include <common.scad>;

module saucer_saucer() {
    saucer_basic();
    
    translate([0,0,saucer_height/2])
    bridge_module();
    
    difference() {
        hull() {
            translate([0,0,-saucer_height/2])
            cylinder(d=scout_width+20, h=scout_height*2, center=true);

            translate([-saucer_width/2+scout_width,0,-saucer_height/2])
            cylinder(d=scout_width+20, h=scout_height*2, center=true);
        }

        hull() {
            translate([0,0,-saucer_height/2])
            cylinder(d=scout_width, h=scout_height*2.5, center=true);

            translate([-saucer_width/2+scout_width,0,-saucer_height/2])
            cylinder(d=scout_width, h=scout_height*2.5, center=true);
        }
    }
}





module saucer_body() {
    difference() {
        saucer_truncate() body_offset() body_basic();

        translate([-body_pos_x_offset*1.5,0,-body_width/2-saucer_height/2])
        sphere(d=body_width-10, $fn=100);
    }
}

module saucer_truncate() {
    intersection() {
        children();
        cube(saucer_width+.01, center=true);
    }
}

module saucer_neck() {
    neck_h=saucer_height/2 + body_width/2;

    saucer_truncate()
    translate([-saucer_width/2,0,-neck_h/2+saucer_height/2])
    scale([8,1.5,1])
    cylinder($fn=64, r1=0, r2=50, h=neck_h, center=true);
}

module saucer() {
    saucer_saucer();
    saucer_body();
    saucer_neck();
    saucer_assembly();
}

saucer();

module saucer_assembly() {
    util_mirrored([0,1,0])
    translate([-saucer_width/2+saucer_nacelle_w,1.8*scout_width/2,-saucer_height/2-body_width/2])
    saucer_nacelle();

    translate([-saucer_width/2+saucer_nacelle_w,0,-saucer_height/2-body_width/2])
    rotate([90,0,0])
    cylinder(d=saucer_nacelle_w, h=1.8*scout_width, center=true);
}

module saucer_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,saucer_nacelle_h/4])
    util_ovoid(saucer_nacelle_l/2, saucer_nacelle_l/2, saucer_nacelle_w,
    saucer_nacelle_h/4,saucer_nacelle_h/4);
}