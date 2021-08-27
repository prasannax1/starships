use <../lib/util.scad>;
include <common.scad>;

module warp() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,wt_w/4,0])
        util_ovoid(wt_f-25,wt_b, wt_w/2, wt_h/2-10, 10);

        util_mirrored([0,1,0])
        translate([0,wt_w/8,wt_h*.75])
        util_ovoid(wt_f,wt_b-100, wt_w/2, wt_h/4, wt_h/4);
    }

    translate([wt_f*.8,0,wt_h*.75])
    disk_class_2();
    translate([wt_f*.8,0,wt_h*.87])
    disk_class_1();
}

warp();