use <../lib/util.scad>;
use <icp.scad>;

module explorer() {
    icp_saucer_large();
    util_saucer(18,40,10);
    
    difference() {
        translate([-0,0,0])
        util_ovoid(30,40,22,10,6);
        
        translate([-40,0,-7])
        scale([3,1,1])
        rotate([90,0,0])
        cylinder(h=50,r=7,center=true);
        
        translate([30,0,-7])
        scale([30/7,1,1])
        rotate([90,0,0])
        cylinder(h=50,r=7,center=true);
    }
    
    util_ovoid(15,10,20,1,5);
    
    translate([-15,0,-4])
    difference() {
        translate([-20,0,4])
        util_nacelle_bar(40,10,45,.8);
        
        translate([-46.5,0,0])
        cylinder(40,25,25,center=true);
        
        util_mirrored([0,1,0])
        translate([5,60,0])
        cylinder(40,50,50,center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-25,18,6])
    util_nacelle(54,10,6,curved=true);
    
}

explorer();


