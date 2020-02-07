use <../lib/util.scad>;
use <icp.scad>;

module science() {
    icp_saucer_large();

    translate([-3.5,0,7.5])
    mirror([0,0,1])
    util_nacelle_bar(25,10,6,2);
    
    util_mirrored([0,1,0])
    translate([-7.5,9,-4])
    difference(){
        
        rotate([90,0,0])
        mirror([1,0,0])
        util_nacelle(45,6,10,curved=true,up=false);
        
        translate([0,0,-50])
        cube(100,center=true);
    }


}

science();