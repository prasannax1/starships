use <../lib/util.scad>;
include <common.scad>;

module warp_nacelle() {
    util_mirrored([0,1,0])
    translate([-0/2,21,0])
    rotate([0,90,0])
    rotate(-0)
    intersection() {
        cylinder(h=warp_length*.75, d=80, $fn=3, center=true);
        rotate(180)
        cylinder(h=warp_length, d=120, $fn=3, center=true);
    }
}

module warp_unpos() {
    difference() {
        hull() {
            difference() {
                util_mirrored([1,0,0])
                translate([warp_length/2,0,0])
                scale([2,1,1])
                rotate([90,0,0])
                rotate(30)
                cylinder(d=80, h=50, $fn=3, center=true);

                translate([-warp_length/2, 0, warp_length/2])
                cube(warp_length, center=true);
            }

            translate([0,0,30])
            scale([1,1,.5])
            rotate([0,90,0])
            translate([0,0,warp_length/6])
            rotate(90)
            cylinder(h=warp_length*.6, d=100, $fn=6, center=true);

        }

        translate([75+warp_length/2,0,48])
        cube([200, 48, 50], center=true);
        
        translate([-250-120,0,60])
        cube([500,50,100],center=true);
    }

    translate([30+warp_length/2,0,24])
    disk_class_2();

    translate([75,0,-12])
    warp_nacelle();
}

module warp() {
    translate([-warp_length/4,0,38]) warp_unpos();
}

warp();