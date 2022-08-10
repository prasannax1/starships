use <../lib/util.scad>;
include <common.scad>;

module escort_plus() {
    disk_1();
    
    difference() {
        translate([0,0,3])
        scale([1,1,.25])
        sphere(d=scout_width-1.2*bridge_width, $fn=faces_rough);
        
        translate([0,0,-scout_width/2+1.5])
        cube(scout_width, center=true);
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
    translate([0,3/8*scout_width,0])
    translate([-25,25/2,0])
    cube([50,25,25], center=true);
}

module escort_assembly() {
    util_mirrored([0,1,0])
    {
        translate([-scout_width/2-scout_height/2,scout_width/2-7.5,scout_height-9])
        rotate([60,0,0])
        nacelle(scout_height/2,scout_height/2,scout_width);

        translate([-11,3/8*scout_width, 2])
        cube([25,15,2],center=true);
    }
    

}



module escort(carrier_attached=true) {
    difference() {
        escort_plus();
        escort_minus();
    }
    
    escort_assembly();
    
    if (carrier_attached == true) {
        util_mirrored([0,1,0])
        translate([-scout_width/2-scout_height/2-1,scout_width/2-2,0])
        rotate([0,90,0])
        cylinder(d=scout_height, h=scout_width+2, center=true);
    }
}

escort(carrier_attached=false);