use  <../lib/util.scad>;
include <common.scad>;

module warp_nacelle() {
    difference() {
        scale([1,.64,1.5])
        intersection() {
            rotate([0,90,0])
            rotate(90) {
                translate([0,0,warp_length/2-.02])
                scale([1,1,2])
                sphere(d=scout_width, $fn=6);

                translate([0,0,warp_length/4-.01])
                cylinder(d=scout_width, h=warp_length/2, center=true, $fn=6);

                translate([0,0,-warp_length/4+.01])
                cylinder(d2=scout_width, d1=scout_width*.75, h=warp_length/2, center=true, $fn=6);

                translate([0,0,-warp_length/2+.02])
                scale([1,1,2])
                sphere(d=scout_width*.75, $fn=6);
            }

            translate([0,0,.6*warp_length-.01])
            cube(1.2* warp_length, center=true);
        }
        
        translate([-warp_length/2,0,0])
        rotate([0,-45,0])
        translate([-scout_width,0,0])
        cube(2*scout_width, center=true);
    }
}



module warp_body() {
    difference() {
        intersection() {
            scale([2.5, 1, 1.5])
            rotate([90,0,0]) {
                util_mirrored([0,0,1])
                translate([0,0,scout_width/2-20+10-.01])
                cylinder(d1=scout_width, d2=scout_width-40, h=20, center=true, $fn=4);

                cylinder(d=scout_width, h=scout_width-40, center=true, $fn=4);
            }

            translate([0,0,-7/2*scout_width])
            cube(7*scout_width, center=true);
        }
        
        translate([scout_width,0,0])
        cylinder(d=40, h=200, center=true, $fn=faces_concave);
        
        translate([scout_width+50,0,0])
        cube([100,40,200], center=true);
        
        translate([-2.5/2*scout_width, 0, -1.5/2*scout_width])
        scale([2.5,1,1.5])
        rotate([90,0,0])
        cylinder(h=50, d=scout_width, center=true, $fn=faces_concave);
    }

    translate([-warp_length/2,0,-5])
    cube([warp_length, scout_width, 10], center=true);

    translate([-warp_length,0,-5])
    cylinder(h=10, d=scout_width, $fn=faces_convex, center=true);
}



module warp_hangar() {
    mirror([0,0,1]) {
        difference() {
            hull()
            util_mirrored([1,0,0])
            translate([warp_length/4, 0, 0])
            cylinder(h=35, d1=scout_width, d2=scout_width*.5, center=true, $fn=faces_convex);

            util_mirrored([1,0,0])
            translate([scout_width/4 + warp_length/4 ,0,0])
            cube([scout_width/2, scout_width*1.5, 25], center=true);
        }

        util_mirrored([1,0,0])
        translate([warp_length/4, 0, 0])
        cylinder(h=34, d1=scout_width*.9, d2=scout_width*.5*.9, center=true, $fn=16);

        util_mirrored([1,0,0])
        translate([warp_length/4,0,35/2])
        disk_0();
    }
}



module warp_saucer() {
    translate([scout_width,0,-.01])
    disk_1();
}


module warp_secondary() {
    warp_body();

    util_mirrored([0,1,0])
    translate([-warp_length/2-scout_width/2,.64/2* scout_width, -.01-9])
    warp_nacelle();

    translate([-warp_length+warp_length/4,0, -35/2-10+.01])
    warp_hangar();
}

module warp_unpos() {
    warp_secondary();
    warp_saucer();
}


module warp() {
    translate([warp_length/4,0,10-.01]) warp_unpos();
}

warp();