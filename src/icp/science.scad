use <../lib/util.scad>;
use <icp.scad>;

module science() {
    icp_saucer_large();

    


}

science();

util_mirrored([0,1,0])
translate([0,20,7])
scale([1,1,.5]) {
util_mirrored([1,0,0])
translate([15/2,0,0])
sphere(2.5, $fn=32);

rotate([0,90,0])
cylinder(15,2.5,2.5,center=true,$fn=32);
}

translate([-5,0,0])
util_nacelle_bar(40,7,5,.75);