use <../lib/util.scad>;
include <global_vars.scad>;
include <transwarp_lib.scad>;
include <saucer_lib.scad>;
include <scout_lib.scad>;
//use <transwarp.scad>;
//use <command.scad>;
//use <scout.scad>;
//
//tw();
//cm_pos();
//sc_pos();

module sauc_pos() {
    translate([big_disk_width/2,0,engine_rear_height_offset+neck_height-saucer_height+.01])
    sauc_unpos();



//    intersection() {
//        scale([.99,5,1]) tw_neck();
//
//        translate([0,0,engine_rear_height_offset+neck_height-saucer_height/2])
//        cube([500,500,saucer_height], center=true);
//    }
    
    sauc_nacelle_assembly();
    

    difference() {
        translate([0,0,neck_height-saucer_height/2-saucer_neck_height])
        util_ovoid(saucer_neck_length*1.2, 20, saucer_neck_width*2, saucer_height*1.5, 5);

        translate([big_disk_width/2,0,0])
        cylinder(d=saucer_engine_width*1.1, h=1000, center=true);
    }
    
    translate([40,0,neck_height-saucer_height/2-saucer_neck_height+5])
    cube([50,350,7], center=true);
}




module sauc_unpos() {
    difference() {
        util_saucer(saucer_width, saucer_width, saucer_height_ext);

        translate([0,0,saucer_width/2+saucer_height])
        cube(saucer_width, center=true);
    }
    
    difference() {
        util_ovoid(saucer_engine_width/2, saucer_engine_width/2, saucer_engine_width, 5, saucer_engine_height_ext);

        translate([0,0,-saucer_width/2 - saucer_engine_height])
        cube(saucer_width, center=true);
    }
}


module sauc_single() {
    sauc_final(tw_attached=false, sc_attached=false);
}

sauc_final();

module sauc_final(tw_attached=true, sc_attached=true) {
    difference() {
        sauc_pos();
        
        if (tw_attached == false) {
            scale([1,1,1.5]) tw_neck();
        }
        
        if (sc_attached == false) {
            translate([sc_saucer_width/2+big_disk_width/2,0,engine_rear_height_offset+neck_height-saucer_height-saucer_engine_height])
            util_ovoid(sc_saucer_width/2, sc_saucer_width/2, sc_saucer_width,sc_saucer_height_ext, 2*sc_saucer_height_ext);
        }
        
        translate([sc_saucer_width/2+big_disk_width/2,0,engine_rear_height_offset+neck_height-saucer_height-saucer_engine_height])
        cylinder(d=sc_saucer_width+5,h=5,center=true);
        
        translate([big_disk_width/2-saucer_engine_height,0,engine_rear_height_offset+neck_height-saucer_height-saucer_engine_height])
        rotate([90,0,0])
        cylinder(r=saucer_engine_height, h=sc_saucer_width,center=true);

        translate([big_disk_width/2-saucer_engine_height-saucer_engine_width/4,0,engine_rear_height_offset+neck_height-saucer_height-saucer_engine_height])
        cube([saucer_engine_width/2, sc_saucer_width, 1.9*saucer_engine_height],center=true);
    }
}



module sauc_nacelle_assembly() {
    util_mirrored([0,1,0]) {
        translate([nacelle_length/2+40, neck_width*3.2,engine_rear_height_offset+neck_height-saucer_height-nacelle_height*1.2])
        sauc_nacelle();

//        translate([0, neck_width*2.5-nacelle_width_back/2,engine_rear_height_offset+neck_height-saucer_height-nacelle_height+15])
//        scale([2,1,1])
//        cylinder(h=30,r=10,center=true);
   }
   
   
   
}

module sauc_nacelle() {
    hull() {
        translate([nacelle_length/2,0,0])
        util_ovoid(nacelle_width_front/2,nacelle_width_front/2,nacelle_width_front,nacelle_height/2, nacelle_height/2);


        translate([-nacelle_length/2,0,0])
        util_ovoid(nacelle_width_back/2,nacelle_width_back/2,nacelle_width_back,nacelle_height/2, nacelle_height/2);
    }
}