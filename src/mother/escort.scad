use <../lib/util.scad>;
include <common.scad>;
use <scout_engine.scad>;

module escort_plus() {
    disk_1();
    
    escort_ribbed_cylinder();
}

module escort_ribbed_cylinder() {
    rotate_extrude(angle = 360, convexity=10, $fn=faces_convex)
    difference() {
        translate([(scout_width-bridge_width)/4, (scout_height-bridge_height)/2,0])
        square([(scout_width-bridge_width)/2, scout_height-bridge_height], center=true);

        translate([(scout_width-bridge_width)/2,0,0])
        rotate(45)
        translate([2*scout_height,0,0])
        square(4*scout_height, center=true);
        
        util_repeat(15, [-.5,.5,0])
        translate([(scout_width-bridge_width)/2-1.5,1.5,0])
        square([5,.25],center=true);
    }
}



module escort_minus() {
    
    translate([-scout_width,0,0])
    intersection() {
        scale([1,1,1.5/1.8])
        rotate([0,90,0])
        cylinder(h=1, d=scout_height*2.2, $fn=faces_concave, center=true);
        
        translate([0,0,25/2+2])
        cube(25, center=true);
    }
    
    util_mirrored([0,1,0])
    translate([0,3/8*scout_width-5,0])
    translate([-25,25/2,0])
    cube([50,25,25], center=true);
    
    translate([scout_width/2,0,0])
    cube(bridge_width, center=true);
}


module escort_assembly() {
    util_mirrored([0,1,0])
    {
        translate([-scout_height/2,scout_width/4-10,1])
        scout_engine(60);
    }
}



module escort(carrier_attached=true) {
    difference() {
        escort_plus();
        escort_minus();
    }
    
    escort_assembly();
}

escort(carrier_attached=false);