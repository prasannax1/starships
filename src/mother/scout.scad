use <../lib/util.scad>;
include <common.scad>;

module scout_disk() {
    disk_class_1();
    disk_class_2();
    
    translate([0,0,3.5])
    sphere(d=20, $fn=faces_convex);
}



module scout_neck() {
    difference() {
        intersection() {
            translate([0,0,-24+10])
            scale([1.5,1,.5])
            rotate([90,0,0])
            cylinder(d=scout_width, h=10, $fn=faces_concave, center=true);

            union() {
                translate([-scout_width/2,0,7-.2])
                cube([scout_width, 20,7], center=true);

                translate([-scout_width/4,0,10])
                translate([-scout_width/2,0,-scout_width/2])
                cube(scout_width,center=true);
            }
        }

        translate([0,0,-14])
        translate([-scout_width/2,0,-scout_width/2])
        cube(scout_width, center=true);
    }
}

module scout_body() {
    difference() {
        intersection() {
            translate([-scout_width/2.5,0,-14])
            util_ovoid(
                scout_width/3.6,
                scout_width/1.2,
                24,
                12, 
                12,
                faces=faces_convex);

            translate([-scout_width/5,0,0])
            translate([-scout_width*.75/2,0,0])
            cube(scout_width*.8, center=true);
        }


        translate([-20,0,-14])
        scale([.5,1,1])
        sphere(d=14, $fn=faces_concave);

        translate([-scout_width+7.5,0,-12-14])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(d=24, h=50, $fn=faces_concave, center=true);
        
        intersection() {
            translate([-scout_width+2.5, 0, -14])
            rotate([0,90,0])
            cylinder(d=16, h=2, $fn=faces_concave, center=true);

            translate([-scout_width+7.5,0,-13])
            translate([0,0,25])
            cube(50, center=true);
        }
    }
}


module scout_nacelle() {
    translate([scout_width/2.2,0,0]) {
        difference() {
            util_ovoid(
                15,scout_width*1.5,15,15/2,15/2,
                faces=faces_convex);

            translate([15,0,0])
            sphere(r=15,$fn=faces_concave);

            translate([-scout_width*1.1,0,0])
            rotate([0,-45,0])
            translate([-scout_width/2,0,0])
            cube(scout_width, center=true);
        }

        sphere(d=12, $fn=faces_convex);

        
        translate([-scout_width,0,0])
        util_mirrored([0,1,0])
        rotate([45,0,0])
        translate([0,0,7.5/2])
        cube([12.5,2,7.5], center=true);
    }
}

module scout_bar() {
    hull() {
        sphere(d=3);
        translate([-5,0,0]) sphere(d=3);
        translate([-50,0,scout_width/2-15]) sphere(d=2);
        translate([-100,0,scout_width/2-15]) sphere(d=2);
    }
}

module scout_assembly(theta) {
    translate([-scout_width/2+10,0,-14])
    util_mirrored([0,1,0])
    rotate([-theta,0,0]) {
        scout_bar();
        translate([-70,0,scout_width/2-15]) 
        rotate([theta,0,0])
        scout_nacelle();
    }
}

module scout(saucer_attached=true) {
    scout_disk();
    scout_neck();
    scout_body();
    if (saucer_attached == false) {
        scout_assembly(theta=scout_theta);
    } else {
        scout_assembly(theta=70);
    }
}

scout(saucer_attached=false);



