use <../lib/util.scad>;
include <common.scad>;

module escort_unpos() {
    hull()
    util_mirrored([0,1,0])
    translate([escort_l/4,escort_w/4,0])
    util_ovoid(escort_l/5, escort_l/3, escort_w/3, 1, escort_h, faces=6);

    hull()
    util_mirrored([0,1,0])
    translate([escort_l/4,escort_w/8,0])
    util_ovoid(escort_l/4, escort_l/3, escort_w/4, 5, escort_h*1.5, faces=6);

    difference() {
        hull()
        util_mirrored([0,1,0])
        translate([-escort_l/4,escort_w/4,0])
        util_ovoid(escort_l*.64, escort_l/5 ,escort_w/2, 5, escort_h*1.2, faces=6);

        cube([saucer_width, command_body_w, saucer_width], center=true);
    }
}

module escort_pos() {
    translate([-saucer_width/2-carrier_body_l/2-40,0,carrier_elevation*2])
    children();
}

module escort() {
    escort_pos()
    escort_unpos();
}

escort();