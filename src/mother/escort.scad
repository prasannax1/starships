use <../lib/util.scad>;
include <common.scad>;

module escort_plus() {
    union() {
        intersection() {
            disk_1();

            translate([0,0,scout_width/2])
            cube (scout_width, center=true);
        }

        translate([-20,0,0])
        difference() {
            scale([7.6,2,1.5])
            intersection() {
                rotate([0,90,0])
                sphere(d=20, $fn=faces_convex);

                translate([0,0,15])
                cube (30, center=true);
            }

            translate([0,0,1.5*scout_width + 10])
            cube(3*scout_width, center=true);
        }
    }
}

module escort_minus() {
    translate([scout_width,0,0])
    cube(scout_width, center=true);
    
    translate([-scout_width*1.28,0,scout_width/2+1.5])
    cube(scout_width, center=true);
    
    util_mirrored([0,1,0])
    translate([0,scout_width/2,0])
    scale([2,1,1])
    cylinder(d=20, h=30, $fn=6, center=true);
}

module escort_body() {
    difference() {
        escort_plus();
        escort_minus();
    }
}

module escort(carrier_attached=true) {
    escort_body();
    
    if (carrier_attached == true) {
        cube(16, center=true);
    }

    translate([-scout_width*.77,0,1.5]) 
    scale([1,1,.6])
    difference() {
        sphere(d=24, $fn=faces_rough);
        
        translate([0,0,-15-.5]) cube(30, center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-scout_width/2+15, scout_width/2-2.5, 7.5])
    rotate([-45,0,0])
    nacelle(10, 8, scout_width);

}

escort(carrier_attached=false);