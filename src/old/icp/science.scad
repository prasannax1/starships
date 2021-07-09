use <../lib/util.scad>;
use <icp.scad>;
use <../aux/hulls.scad>;

module science_old() {
    icp_saucer_large();

    util_mirrored([0,1,0])
    translate([0,14,.75])
    util_ovoid(25,15,10,5,5,faces=7);

}

module science() {
    heavy_hull();
}

science();

