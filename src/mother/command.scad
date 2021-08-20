use <../lib/util.scad>;
include <common.scad>;


command_saucer_height=20;

command_body_f=150;
command_body_b=100;
command_body_u=command_saucer_height;
command_body_l=command_body_width/2;
command_nacelle_theta=18;

module command_saucer() {
    util_saucer_shape(command_saucer_width, command_saucer_height, scout_height*.5, 1,1);

    translate([0,0,command_saucer_height])
    bridge_module();
    
    translate([-0.75*scout_width/2,0,0])
    util_ovoid(5,command_saucer_width/2, command_body_width, command_saucer_height+scout_height*.75,1);
    
    translate([0,0,-1])
    util_saucer_shape(bridge_width, 1,1,bridge_height,1);
}



module command_body() {
    difference() {
        translate([-command_body_f,0,0])
        util_ovoid(command_body_f, command_body_b,
        command_body_width, command_body_u, command_body_l);


        translate([-command_body_f-command_body_l,0,-command_body_l-3])
        rotate([90,0,0])
        cylinder($fn=100, h=command_body_width*1.5, r=command_body_l, center=true);

        translate([-command_body_width*.75-command_body_f-command_body_l,0,-command_body_width*.75-3])
        cube(1.5*command_body_width, center=true);

        translate([0,0,-command_body_l])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder($fn=100, h=command_body_width*1.5, r=command_body_l, center=true);
    }
}

module command_pos() {
    translate([0,0,saucer_height/2 + tw_saucer_height])
    children();
}

module command(tw_attached=true) {
    command_pos() {
        command_saucer();
        command_body();
        if (tw_attached == true) {
            command_assembly(0);
        } else {
            command_assembly(command_nacelle_theta);
        }
    }
}

command(tw_attached=false);

module command_assembly(theta) {
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-command_saucer_width/2-command_nacelle_f*1.1, command_saucer_width/2-command_nacelle_w,0])
        rotate([-theta,0,0])
        command_nacelle();

        hull() {
            translate([-command_saucer_width/2,0,0])
            sphere(d=3);

            translate([-command_saucer_width/2-75,0,0])
            sphere(d=3);

            translate([-command_saucer_width/2-command_nacelle_f*1.1-75, command_saucer_width/2-command_nacelle_w,0])
            sphere(d=2.5);

            translate([-command_saucer_width/2-command_nacelle_f*1.1-100, command_saucer_width/2-command_nacelle_w,0])
            sphere(d=2.5);
        }
    }
}

module command_nacelle() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,command_nacelle_w/4,0])
        util_ovoid(command_nacelle_f, command_nacelle_b, command_nacelle_w/2,command_nacelle_h/2, command_nacelle_h/2);

        translate([0,0,command_nacelle_w/4])
        scale([5,1,.8])
        rotate([90,0,0])
        cylinder($fn=5, h=command_nacelle_w/2, d=command_nacelle_w/2, center=true);
    }
}