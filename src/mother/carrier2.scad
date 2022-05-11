use <../lib/util.scad>;
include <common.scad>;

module carrier_basic() {
    difference() {
        intersection() {
            union() {
                translate([0,0,-carrier_width*5/2+.01+hangar_height/2+20])
                cube(5*carrier_width, center=true);

                translate([-carrier_width*5/2-2*carrier_width,0,0])
                cube(5*carrier_width, center=true);
            }
            translate([-carrier_width,0,0])
            util_ovoid(2*carrier_width, 2*carrier_width, carrier_width, carrier_width/2, carrier_width/2, faces=faces_convex);
        }

        hull() {
            translate([-carrier_width-hangar_height/2,0,0])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=1.5*carrier_width, $fn=faces_concave, center=true);

            translate([-carrier_width*3,0,0])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=1.5*carrier_width, $fn=faces_concave, center=true);

            translate([-carrier_width+hangar_height/2,0,-carrier_width/2-hangar_height])
            rotate([90,0,0])
            cylinder(d=hangar_height, h=1.5*carrier_width, $fn=faces_concave, center=true);
        }
        
        translate([carrier_width*1.2,0,0])
        cube([carrier_width, carrier_width, hangar_height], center=true);

        hull()
        util_mirrored([0,0,1])
        util_mirrored([0,1,0])
        translate([-carrier_width,hangar_width/2-5, hangar_height/2-5])
        rotate([0,90,0])
        cylinder(d=10, h=carrier_width/2, center=true, $fn=faces_rough);
        
        translate([-3.1*carrier_width,0,carrier_width/2+hangar_height/2+4])
        cube(carrier_width, center=true);
        
        intersection() {
            translate([-carrier_width/2,0,0])
            rotate([0,90,0])
            cylinder(d1=carrier_width*.9, d2=carrier_width*.75, h=carrier_width, center=true, $fn=faces_concave);

            translate([-carrier_width, 0, -carrier_width-hangar_height/2-15])
            cube([2*carrier_width, hangar_width, 2*carrier_width], center=true);
        }
    }
}

carrier_basic();

translate([carrier_width*.6,0,0])
cylinder(d=hangar_width*.6, h=hangar_height+10, center=true, $fn=16);

intersection() {
    translate([-.75*carrier_width,0,0])
    cube([carrier_width*1.5, hangar_width+10, hangar_height+10], center=true);

    translate([-carrier_width*.75,0,0])
    rotate([0,-24,0])
    cube([hangar_height+10, hangar_width+10, carrier_width], center=true);
}







