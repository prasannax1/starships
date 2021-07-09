use <../lib/util.scad>;

include <saucer_lib.scad>;
include <transwarp_lib.scad>;
include <carrier_lib.scad>;

//use <saucer.scad>;
//saucer_pos();
//
//use <transwarp.scad>;
//transwarp();




module cr_body() {
    difference() {
        union() {
            translate([-tw_neck_length_2+ cr_b,0,0])
            util_ovoid(cr_f, cr_b, cr_width, 3, cr_height);
            
            util_ovoid(cr_disk_f, cr_disk_b, cr_disk_w, 3, cr_disk_h);
        }

        hull() {
            translate([-tw_neck_length_2 + cr_b - cr_rear_curve_r,0,-cr_rear_curve_r-cr_rear_section_h])
            rotate([90,0,0])
            cylinder(h=cr_width*1.5, r=cr_rear_curve_r, center=true);

            translate([-tw_neck_length_2 + cr_b,0,-cr_rear_curve_r-cr_height])
            rotate([90,0,0])
            cylinder(h=cr_width*1.5, r=cr_rear_curve_r, center=true);

            translate([-tw_neck_length_2 - cr_rear_curve_r,0,-cr_rear_curve_r-cr_rear_section_h])
            rotate([90,0,0])
            cylinder(h=cr_width*1.5, r=cr_rear_curve_r, center=true);
        }
        
        translate([saucer_width/2, 0, -saucer_width/2+ saucer_height*2.5])
        scale([.8,1,.8])
        rotate([90,0,0])
        cylinder(d=saucer_width, h=saucer_width, $fn=6, center=true);
    }
}

module carrier() {
    cr_body();
    cr_assembly();
}


module cr_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0, cr_nacelle_w/4, 0])
    util_ovoid(cr_nacelle_f, cr_nacelle_b, cr_nacelle_w/2, cr_nacelle_h/2, cr_nacelle_h/2);
}

module cr_assembly() {
    util_mirrored([0,1,0])
    translate([-tw_neck_length_2*.6, cr_disk_w/2-1.4*cr_nacelle_w, cr_nacelle_h])
    cr_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([-tw_neck_length_2*.6, cr_disk_w/2-cr_nacelle_w*1.4, cr_nacelle_h])
        rotate([0,90,0])
        cylinder(r=3, h=50, center=true);

        translate([-tw_neck_length_2*.6, cr_disk_w/2-1.4*cr_nacelle_w, -5])
        rotate([0,90,0])
        cylinder(r=3, h=50, center=true);
    }
}

carrier();