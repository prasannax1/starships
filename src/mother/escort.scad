use <../lib/util.scad>;
include <common.scad>;


module escort() {
    translate([-saucer_width/2-tw_body_l-carrier_body_l*.7,0, -carrier_body_h]) {
    hull()
    util_mirrored([0,1,0])
    translate([escort_length/4,escort_width/4,0])
    util_ovoid(escort_length/4.5, escort_length/4, escort_width/2, 3, escort_height*.75, faces=6);

    hull()
    util_mirrored([1,0,0])
    util_mirrored([0,1,0])
    translate([escort_length/4,escort_width/8,0])
    util_ovoid(escort_length/4, escort_length/4, escort_width/2, 3, escort_height, faces=6);


    util_mirrored([0,1,0])
    hull()
    util_mirrored([1,0,0])
    rotate([2.5,0,0])
    translate([escort_length/6,escort_width/4,0])
    util_ovoid(escort_length/4, escort_length/4, escort_width/4, 3, escort_height*1.5, faces=6);
    }
}

escort();