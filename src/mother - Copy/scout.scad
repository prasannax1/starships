use <../lib/util.scad>;
include <common.scad>;

module scout_saucer() {
    disk_1();

    translate([-scout_width/4, 0, scout_height/2])
    cube([scout_width/2, 15, scout_height*1.5], center=true);
    
    translate([0,0,scout_height/2])
    sphere(d=20, $fn=faces_rough);
}

module scout_body() {
    difference() {
        intersection() {
            union() {
                util_ovoid(20,scout_width,20,10,10, faces=faces_convex);
                scale([4,1,1])
                cylinder(d=20, h=4, center=true, $fn=faces_concave);
            }

            translate([-scout_width*.85/2+12,0,0])
            cube([scout_width*.85,30,30], center=true);
        }

        translate([12,0,0])
        scale([.25,1,1])
        sphere(d=15, $fn=faces_concave);
        
        translate([-scout_width*.8,0,-10])
        scale([5,1,1])
        rotate([90,0,0])
        cylinder(r=10, h=30, center=true, $fn=faces_concave);
        
        translate([-scout_width*.8+20,0,.5])
        translate([-15,0,15])
        cube(30, center=true);
    }

    translate([-scout_width*.8+20,0,0])
    intersection() {
        sphere(d=15, $fn=16);
        translate([0,0,10]) cube(20, center=true);
    }

    translate([0,0,15/2]) {
        cube([12,7,15], center=true);
        
        util_mirrored([1,0,0])
        translate([6,0,0])
        cylinder(d=7, h=15, $fn=faces_rough, center=true);
    }
}


module scout_nacelle() {
    translate([0,0,7.5/2])
    nacelle(7.5,7.5, scout_width);
}

module scout_secondary_hull() {
    scout_body();
    util_mirrored([0,1,0]) scout_assembly();
}

module scout() {
    scout_secondary_hull();
    translate([scout_width*.4,0,15-.01]) scout_saucer();
}

module scout_assembly(theta=45) {
    rotate([-theta,0,0]) {
        translate([-scout_width/1.5,0,40]) 
        rotate([theta,0,0])
        scout_nacelle();

        hull() {
            translate([-scout_width/1.5+15,0,40]) 
            sphere(d=2.5);

            translate([-scout_width/1.5-15,0,40]) 
            sphere(d=2.5);

            translate([-10,0,0]) 
            sphere(d=2.5);

            translate([-15,0,0]) 
            sphere(d=2.5);
        }
    }
}

scout_saucer();