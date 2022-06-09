use <../lib/util.scad>;
include <common.scad>;

module escort_plus() {
    disk_1();

    intersection() {
        translate([-scout_width/2+25,0,0])
        util_ovoid(10, 1*scout_width, scout_height*3.6, scout_height*1.5, 10, faces=faces_convex);

        translate([-scout_width/2+25+.01,0,0])
        translate([-.5*.75*scout_width,0,.5*.75*scout_width-.01])
        cube(.75*scout_width, center=true);
    }
}

module escort_minus() {
    translate([scout_width/2,0,0])
    cube(25, center=true);
    
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
        translate([-scout_width/2-scout_height/2-1,scout_width/2-2,scout_height/2])
        rotate([90,0,0])
        nacelle(scout_height,scout_height,scout_width);

        translate([-11,3/8*scout_width, 2])
        cube([25,15,2],center=true);
    }
    
    translate([-scout_width/2+10, 0, 6/2])
    cube([20, 50, 6], center=true);
}




module escort() {
    difference() {
        escort_plus();
        escort_minus();
    }
    
    escort_assembly();
}

escort();