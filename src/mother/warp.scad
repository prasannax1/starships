use <../lib/util.scad>;
include <common.scad>;

module warp_plus() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,wt_w/4,wt_h/4])
        util_ovoid(wt_f-25,wt_b, wt_w/2, wt_h/4, wt_h/4+10);

        util_mirrored([0,1,0])
        translate([0,wt_w/16,wt_h*.75])
        util_ovoid(wt_f,wt_b-100, wt_w/2, wt_h/4, wt_h/4);
    }

    translate([wt_f*.8,0,wt_h*.75])
    disk_class_2();
    translate([wt_f*.8,0,wt_h*.87])
    disk_class_1();
}

module warp_minus() {
    util_repeat(8, [-65,0,0])
    util_mirrored([0,1,0])
    translate([100,50,wt_h*.75])
    cube([50, 50, 22], center=true);
}



module warp() {
    difference() {
        warp_plus();
        warp_minus();
    }
}

warp();