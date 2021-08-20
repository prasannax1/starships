use <../lib/util.scad>;
include <common.scad>;


module tw_body(saucer_attached=true) {
    difference() {
        body_primitive();
        
        cube(saucer_width-.01, center=true);

        translate([-1.3*saucer_width,0,0])
        cube(saucer_width-.01, center=true);
        
        if (saucer_attached == false) {
            translate([-saucer_width/2,0,-saucer_height/2-body_width/2])
            scale([.25,1,1])
            sphere($fn=100, d=100);
        }

    }
}


module body_primitive() {
    body_offset() body_basic();
    
    translate([-saucer_width/2,0,-tw_saucer_height/2])
    scale([2.5,1,1])
    cylinder(h=body_width/2+saucer_height+tw_saucer_height, d1=body_width*.75, d2=saucer_height, center=true);
}

module tw_saucer() {
    difference() {
        hull() {
            translate([0,0,saucer_height/2+tw_saucer_height/2])
            cylinder(h=tw_saucer_height+.2, d1=tw_saucer_width+tw_saucer_height, d2=tw_saucer_width-tw_saucer_height*2, center=true, $fn=64);

            translate([-saucer_width,0,saucer_height/2+tw_saucer_height/2])
            cylinder(h=tw_saucer_height+.2, d1=tw_saucer_width+tw_saucer_height, d2=tw_saucer_width-tw_saucer_height*2, center=true, $fn=64);
        }

        translate([-saucer_width/2-100,0,saucer_height/2])
        rotate([0,-45,0])
        translate([-saucer_width/2,0,0])
        cube(saucer_width, center=true);
        
        cylinder(h=saucer_width, d=tw_saucer_inner, center=true);
        
        translate([-saucer_width/4,0,0])
        cube([saucer_width/2, command_body_width, saucer_width], center=true);
    }
    
    translate([-saucer_width/2-bridge_width, 0, saucer_height/2+tw_saucer_height*1.5])
    bridge_module();
}



module transwarp(saucer_attached=true) {
    tw_saucer();
    tw_body(saucer_attached);
    tw_assembly();
}

transwarp(saucer_attached=false);

module tw_assembly() {
    difference() {
        util_mirrored([0,1,0])
        translate([-tw_nacelle_f+90,0,0])
        body_offset() {
            rotate([tw_nacelle_theta,0,0]) {
                translate([-150,0,body_width*1.75])
                rotate([-tw_nacelle_theta,0,0])
                tw_nacelle();

                hull() {
                    translate([-250,0,body_width*1.75])
                    sphere(d=20);

                    translate([-400,0,body_width*1.75])
                    sphere(d=20);

                    translate([200+tw_nacelle_f,0,0])
                    sphere(d=20);

                    translate([tw_nacelle_f,0,0])
                    sphere(d=20);
                }
            }
        }
        
        translate([-saucer_width/2,0,-saucer_height/2-body_width/2])
        scale([3,1,1])
        sphere($fn=100, d=100);
        
                cube(saucer_width-.01, center=true);
    }
}

module tw_nacelle() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,tw_nacelle_l_w/4,-tw_nacelle_h/4])
        util_ovoid(tw_nacelle_f, tw_nacelle_b,
        tw_nacelle_l_w/2, tw_nacelle_h/4, tw_nacelle_h/4);

        util_mirrored([0,1,0])
        translate([0,tw_nacelle_u_w/4,tw_nacelle_h/4])
        util_ovoid(tw_nacelle_f-25, tw_nacelle_b-75,
        tw_nacelle_u_w/2, tw_nacelle_h/4, tw_nacelle_h/4);
        
        translate([tw_nacelle_h,0,tw_nacelle_h/7.5])
        scale([4,1,1])
        rotate([90,0,0])
        cylinder(h=tw_nacelle_u_w/2, d=tw_nacelle_h, $fn=5, center=true);
    }    
}