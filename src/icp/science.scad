use <../lib/util.scad>;
use <icp.scad>;

module science() {
    icp_saucer_large();

    util_mirrored([0,1,0])
    translate([0,14,.75])
    util_ovoid(25,10,10,5,5,faces=7);

}

science();

