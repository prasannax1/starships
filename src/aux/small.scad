use <../lib/util.scad>;
use <common.scad>;

module shuttle_body() {
    hull() {
        translate([5.5-.5,0,.75])
        rotate([90,0,0])
        cylinder(d=.5,h=1.5,center=true,$fn=10);
        
        translate([4,0,2])
        rotate([90,0,0])
        cylinder(d=.2,h=1.5,center=true,$fn=10);
        
        translate([2,0,.5])
        scale([1,3.4/6,.8])
        difference() {
            rotate([0,90,0])
            rotate(30)
            cylinder(h=2,r=3,center=true, $fn=6);
            
            translate([0,0,-5.5])
            cube(10,center=true);
        }

        translate([.5,0,1.3])
        rotate([0,90,0])
        cylinder(r=1.25,h=1,center=true,$fn=16);
    }

    translate([0,0,.25])
    rotate(90)
    airlock(.5);
}

module shuttle() {
    shuttle_body();
    shuttle_nacelles();
}

module shuttle_nacelles() {
    util_mirrored([0,1,0])
    translate([1.8,1.75,.25])
    hull()
    util_mirrored([1,0,0])
    translate([1.5,0,0])
    sphere(.25, $fn=10);
}

module shuttlepod() {
    hull() {
        difference() {
            translate([0,0,-.25])
            sphere(3/2, $fn=16);
            translate([0,0,-2-1.2])
            cube(4,center=true);
            
            translate([-2,0,0])
            cube(4, center=true);
        }

        translate([-1,0,0])
        rotate([0,90,0])
        cylinder(d=2.4, h=.5, center=true, $fn=16);
    }

    translate([-1.25,0,-1])
    rotate(90)
    airlock(.5);
}


translate([0,0,.25])
rotate(90)
airlock(1);

translate([1,0,2.5])
rotate([0,180,0])
util_nacelle(8,2.5,1,curved=true,up=false);