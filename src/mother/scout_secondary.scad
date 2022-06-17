use <../lib/util.scad>;
include <common.scad>;

module scout_body() {
    difference() {
        intersection(){
            translate([-scout_width/2,0,0])
            util_ovoid(.5*scout_width, .5*scout_width, 2*scout_height, scout_height, scout_height, faces=faces_convex);

            union() {
                translate([-scout_width/2-10,0,-scout_width/2+.02])
                cube (scout_width, center=true);
                
                translate([-scout_width+25.01,0,0])
                cube([scout_width, 12.01, 20], center=true);
                
                translate([-scout_width+.01,0,0])
                cube(scout_width, center=true);
            }
        }

        translate([-scout_width,0,-scout_height])
        scale([5,1,1])
        rotate([90,0,0])
        cylinder(r=scout_height, h=scout_height*2, $fn=faces_concave, center=true);
    }
}

module scout_nacelle() {
    translate([0,0,scout_height/4]) {
        nacelle(scout_height,scout_height/2,scout_width);

        translate([-scout_width/2*.8,0,scout_height/4])
        util_mirrored([0,1,0])
        rotate([45,0,0])
        translate([0,0,3])
        cube([10,1,6], center=true);
    }
}

module scout_secondary() {
    scout_body();
    scout_assembly(scout_theta);
}

module scout_assembly(theta) {
    util_mirrored([0,1,0])
    rotate([-theta,0,0]) {
        translate([-scout_width-scout_height/2,0,2.4*scout_height])
        rotate([theta,0,0])
        scout_nacelle();


        hull() {
            translate([-scout_width*.75+5,0,2.4*scout_height])
            sphere(d=3);

            translate([-scout_width*.75-5,0,2.4*scout_height])
            sphere(d=3);

            translate([-scout_width*.75+5,0,1.01])
            sphere(d=3);

            translate([-scout_width*.75-5,0,1.01])
            sphere(d=3);
        }
    }
}

scout_secondary();