use <../lib/util.scad>;
use <icp.scad>;

module scout() {
    icp_saucer_large();
    util_saucer(18,40,10);
    
    difference() {
        translate([0,0,5]) {
            mirror([0,0,1])
            util_saucer(45,25,10);
            
            util_saucer(45,25,5);
        }
        
        translate([-20,0,-7])
        scale([1.5,1,1])
        rotate([90,0,0])
        cylinder(45,10,10,center=true);
    }
    
    difference() {
        translate([-20,0,3])
        util_nacelle_bar(40,5,45,.8);
        
        translate([-46.5,0,0])
        cylinder(40,25,25,center=true);
        
        util_mirrored([0,1,0])
        translate([5,60,0])
        cylinder(40,50,50,center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-15,18,4])
    util_nacelle(40,8,8,curved=true);
    
}

scout();