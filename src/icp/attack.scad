use <../lib/util.scad>;
use <icp.scad>;


module model2() {

    icp_saucer_large();
    util_mirrored([0,1,0]) 
        translate([-0,11,4])
            rotate([60,0,0])
                util_nacelle(40,8,14,curved=true,up=false);

}

module attack() {
    model2();
}

attack();