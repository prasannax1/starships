use <../lib/util.scad>;

include <saucer_lib.scad>;
include <transwarp_lib.scad>;


//use <saucer.scad>;
//saucer_pos();

module tw_body() {
    difference() {
        intersection() {
            translate([tw_neck_length/2-100,0,0])
            util_nacelle(tw_neck_length*1.4, tw_neck_length*.75, tw_neck_height, curved=true);

            cube([tw_neck_length*2.5, tw_neck_width, tw_neck_height*2], center=true);
        }

        translate([saucer_width/2,0,0])
        cylinder(h=saucer_height*2-.01, d=saucer_width*1.25, center=true);
    }
}

module tw_disk() {
    difference() {
        hull() {
            translate([saucer_width/2, 0, saucer_height-.01])
            util_ovoid(tw_disk_width/2, tw_disk_width/2, tw_disk_width, tw_disk_height_ext, 1);
            
            translate([0,0,saucer_height-.01])
            util_ovoid(tw_neck_width/2, tw_neck_width/2, tw_neck_width, tw_disk_height, 1);
        }

        translate([saucer_width/2, 0, saucer_width/2 + saucer_height + tw_disk_height])
        cube(saucer_width, center=true);
        
        translate([saucer_width/2, 0, saucer_height-.01])
        cylinder(h=tw_disk_height*4, d=tw_disk_inner, center=true);
        
        translate([saucer_width/2-tw_disk_width/4, 0, saucer_height-.01])
        cube([tw_disk_width/2, tw_inner_width, tw_disk_height*4], center=true);
    }
}


module transwarp() {
    tw_body();
    tw_disk();
    tw_assembly();
}

module tw_assembly() {
    util_mirrored([0,1,0]) {
        translate([-tw_nacelle_f*1.5+45, tw_disk_width_2/2, tw_nacelle_up])
        tw_nacelle();


        hull() {
            translate([-tw_nacelle_f*1,0,saucer_height/2])
            sphere(tw_nacelle_inner_r);

            translate([-tw_nacelle_f*2,0,saucer_height/2])
            sphere(tw_nacelle_inner_r);

            translate([-tw_nacelle_f*2.5+75,tw_disk_width_2/2,tw_nacelle_up])
            sphere(tw_nacelle_outer_r);

            translate([-tw_nacelle_f*3+75,tw_disk_width_2/2,tw_nacelle_up])
            sphere(tw_nacelle_outer_r);
        }
    }
}

module tw_nacelle() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0,tw_nacelle_w/4,tw_nacelle_h/8])
    util_ovoid(tw_nacelle_f, tw_nacelle_b, tw_nacelle_w/2, tw_nacelle_h/4, tw_nacelle_h/4);

    hull()
    util_mirrored([0,1,0])
    translate([0,tw_nacelle_w/4, 0])
    util_ovoid(tw_nacelle_f, tw_nacelle_f/4, tw_nacelle_w/2, tw_nacelle_h/2, 1);
}

transwarp();