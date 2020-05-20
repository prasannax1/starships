use <../lib/util.scad>;
use <icp.scad>;

module science() {
    icp_saucer_large();

util_mirrored([0,1,0])
difference() {
translate([1,8,0])
scale([1,1.2,.8])
rotate(90)
rotate([90,0,0])
sphere(10, $fn=6);
    
    translate([0,0,-250])
    cube(500,center=true);
}


}

science();

