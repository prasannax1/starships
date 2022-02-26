use <../lib/util.scad>;
include <common.scad>;


module escort_disk(carrier_attached=true) {
    difference(){
        intersection() {
            scale([1,1,.3])
            sphere(d=150, $fn=faces_convex);

            cube([200,200,20], center=true);
        }

        if (carrier_attached==false) {
            translate([0,0,10+.01])
            cylinder(h=20, d1=scout_width*.75-20, d2=scout_width*.75+20, $fn=faces_concave, center=true);
        }
    }

    disk_class_2();
}

module escort(carrier_attached=true) {
    translate([0,0,-10+.01])
    escort_disk(carrier_attached);
    escort_body();
    escort_assembly();
}

module escort_body() {
    difference() {
        intersection() {
            scale([1,.5,1])
            rotate([0,90,0]) {
                cylinder(r=30, h=150, $fn=faces_convex, center=true);

                translate([0,0,75])
                scale([1,1,.5])
                sphere(r=30, $fn=faces_convex);

                translate([0,0,-75])
                scale([1,1,3])
                sphere(r=30, $fn=faces_convex);
            }

            translate([0,0,-125+.01])
            cube(250, center=true);
        }
        translate([0,0,0])
        cylinder(h=20, d1=scout_width*.75-20, d2=scout_width*.75+20, $fn=faces_concave, center=true);
        
        translate([-125,0,-30])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(r=18, h=100, center=true, $fn=faces_concave);
        
        translate([-125,0,-6])
        cube([4,20,8], center=true);
    }
}

module escort_assembly() {
    util_mirrored([0,1,0])
    translate([0,75-10,-10])
    rotate([45,0,0])
    escort_nacelle();
}

module escort_nacelle() {
    difference() {
        union() {
            sphere(d=20, $fn=faces_convex);
            translate([0,0,-10]) sphere(d=20, $fn=faces_convex);

            translate([-120,0,0]) {
                sphere(d=20, $fn=faces_convex);
                translate([0,0,-10]) sphere(d=20, $fn=faces_convex);
            }

            translate([-60,0,-5])
            cube([120,20,10], center=true);

            translate([0,0,-5])
            cylinder(h=10, d=20, center=true, $fn=faces_convex);

            translate([-120,0,-5])
            cylinder(h=10, d=20, center=true, $fn=faces_convex);

            translate([-60,0,0])
            rotate([0,90,0])
            cylinder(d=20, h=120, center=true, $fn=faces_convex);

            translate([-60,0,-10])
            rotate([0,90,0])
            cylinder(d=20, h=120, center=true, $fn=faces_convex);
        }

        util_mirrored([0,1,0])
        translate([-60,10,-5])
        rotate([0,90,0])
        cylinder(d=5, h=120, $fn=faces_concave, center=true);
    }
}

escort(carrier_attached=false);