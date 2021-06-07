use <../lib/util.scad>;
include <global.scad>;
include <command_lib.scad>;

module command_disk() {
    util_saucer_shape(command_width, command_outer_h,5, 1,2);

    translate([0,0,command_outer_h])
    util_saucer_shape(command_inner_d, command_inner_h, 2, command_inner_h,0);

    translate([0,0,command_outer_h+command_inner_h])
    rotate(180/command_bridge_faces)
    util_ovoid(command_bridge_d/2, command_bridge_d/2, command_bridge_d, command_bridge_h, command_bridge_h, faces=command_bridge_faces);


    translate([0,0,-1])
    rotate(180/command_bridge_faces)
    util_ovoid(command_bridge_d/2, command_bridge_d/2, command_bridge_d, command_bridge_h, command_bridge_h, faces=command_bridge_faces);
}

module command(tw_attached=true) {
    command_position() {
        command_disk();
        command_body();
        if (tw_attached == true) {
            command_assembly(0);
        } else {
            command_assembly(15);
        }
    }
}

module command_assembly(theta=0) {
    util_mirrored([0,1,0])
    rotate([theta,0,0])
    translate([-command_width/2-command_nacelle_f-25,command_width/2-command_nacelle_w2-command_nacelle_w1,0])
    rotate([-theta,0,0])
    command_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([-command_width/2+30,0,command_nacelle_bar_w/2])
        sphere(d=command_nacelle_bar_w);

        translate([-command_width+25+30,0,command_nacelle_bar_w/2])
        sphere(d=command_nacelle_bar_w);

        rotate([theta,0,0])
        translate([-command_width/2-15-(command_nacelle_f+command_nacelle_b)/2,command_width/2-command_nacelle_w2-command_nacelle_w1,command_nacelle_bar_w/2])
        sphere(d=command_nacelle_bar_w);

        rotate([theta,0,0])
        translate([-command_width/2-15-(command_nacelle_f+command_nacelle_b)/2-25,command_width/2-command_nacelle_w2-command_nacelle_w1,command_nacelle_bar_w/2])
        sphere(d=command_nacelle_bar_w);
    }
}

module command_body() {
    difference() {
        translate([-command_body_f,0,0])
        util_ovoid(command_body_f, command_body_b, command_body_w, command_outer_h, command_body_h);

        translate([0,0,-command_width/4])
        scale([1,1,1.1])
        rotate([90,0,0])
        cylinder(d=command_width/2, h=command_width, $fn=64, center=true);

        translate([-command_width/2-command_body_h*2,0,-command_body_h])
        rotate([90,0,0])
        cylinder(r=command_body_h, h=command_width, $fn=64, center=true);


        translate([-command_width-command_body_h*2,0,-command_width/2])
        cube(command_width, center=true);
    }

    util_nacelle(command_width*.85, command_body_w, command_outer_h+command_inner_h+command_bridge_h, curved=true);
    
    translate([-command_body_f,0,0])
    util_ovoid(command_body_f*.85, 5, command_body_w*.9, 3, command_body_h*.9, faces=64);
}



module command_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,command_nacelle_w2/2, 0])
    util_ovoid(command_nacelle_f, command_nacelle_b, command_nacelle_w1, command_nacelle_u, command_nacelle_d);
}

command(tw_attached=false);