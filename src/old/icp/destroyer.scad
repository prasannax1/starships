use <../lib/util.scad>;
use <icp.scad>;


module destroyer() {
    difference() {
        icp_large_saucer_common();
        
        translate([-55,0,0])
            translate([-35,0,0])
            rotate([0,30,0])
            cube(50,center=true);
    }

    translate([-55,0,0])        
    translate([0,0,-2])
    util_ovoid(15,80,12,6,6);

}

destroyer();