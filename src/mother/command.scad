use <../lib/util.scad>;
include <common.scad>;

command_outer_h=command_height-scout_height;

command_body_f=command_width*.75; 
command_body_b=command_width/2.5;
command_body_u=command_outer_h;
command_body_l=command_height;

command_nacelle_f=50;
command_nacelle_b=180;
command_nacelle_w=25;
command_nacelle_u=15;
command_nacelle_l=3;

module command_saucer() {
    util_saucer_shape(command_width, command_outer_h, scout_height,1,1);

    translate([0,0,command_outer_h])
    bridge_module();

    translate([0,0,-1])
    util_saucer_shape(bridge_width, bridge_height,bridge_height,bridge_height,bridge_height);
}

module command_body() {
    difference() {
        translate([-command_width/1.5,0,0])
        util_ovoid(command_body_f, command_body_b, command_body_width, command_body_u, command_body_l);

        translate([0,0,-command_body_l])
        scale([command_width*.25/command_body_l,1,1])
        rotate([90,0,0])
        cylinder(r=command_body_l, h=command_body_width*2, center=true, $fn=100);

        translate([-command_width/1.5-command_body_l,0,-command_body_l-3])
        rotate([90,0,0])
        cylinder(r=command_body_l, h=command_body_width*2, center=true, $fn=100);

        translate([-command_width/1.5-command_body_l,0,-3])
        translate([-saucer_width/2,0,-saucer_width/2])
        cube(saucer_width, center=true);
    }
    
    difference() {
        scale([command_width*.6/command_height,1,1])
        rotate([90,0,0])
        cylinder(r=command_height, h=bridge_width*.5, center=true, $fn=100);

        translate([saucer_width/2,0,0])
        cube(saucer_width, center=true);

        translate([0,0,-saucer_width/2])
        cube(saucer_width, center=true);
    }
}

module command_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,command_nacelle_w/4,0])
    util_ovoid(command_nacelle_f, command_nacelle_b, command_nacelle_w/2, command_nacelle_u, command_nacelle_l);

    hull()
    util_mirrored([0,1,0])
    translate([0,command_nacelle_w/4,0])
    util_ovoid(command_nacelle_f, command_nacelle_f/4, command_nacelle_w/4, command_nacelle_u*1.1, command_nacelle_l);
}

theta=15;

module command_assembly(theta=0) {
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        hull() {
            translate([-command_width/2+30,0,0])
            sphere(d=2);

            translate([-command_width/2-70,0,0])
            sphere(d=2);

            translate([-command_width/2-command_nacelle_f*1.5-25, command_width/2-command_nacelle_w, 0]) 
            sphere(d=2);

            translate([-command_width/2-command_nacelle_f*1.5-50, command_width/2-command_nacelle_w, 0]) 
            sphere(d=2);
        }


        translate([-command_width/2-command_nacelle_f*1.5, command_width/2-command_nacelle_w, 0]) 
        rotate([-theta,0,0])
        command_nacelle();
    }
}

module command(tw_attached=true) {
    translate([0,0,saucer_height+tw_saucer_height-.01]) {
        command_saucer();
        command_body();
        if (tw_attached == true) {
            command_assembly(0);
        } else {
            command_assembly(15);
        }
    }
}

command(false);