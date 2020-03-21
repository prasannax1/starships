use <../lib/util.scad>;
use <common.scad>;


module mvm_transwarp() {
    difference() {
        translate([0,0,-0.01])
        util_saucer(500,360,50);
        


        translate([750/2,0,0])
        cylinder(200,750/2, 750/2, center=true);
    }
    
    translate([0,0,-0.005])
    mvm_secondary_saucer();


    difference() {
        mirror([0,0,1]) {
            util_saucer(500,360,35);
            util_saucer(500,210,100);
        }

    //    translate([0,0,-250-100])
    //    cube(500, center=true);

        translate([-250,0,-100-10])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(500,100,100,center=true);

        translate([280,0,-50+25/2])
        rotate([0,-90,0])
        cylinder(200,40,10,center=true);
    }

    difference() {
        translate([-250/2,0,-5])
        cube([250,500,10], center=true);
        
        util_mirrored([0,1,0])
        translate([0,250,0])
        scale([1.4,1,1])
        cylinder(100,70,70,center=true);
    }

    util_mirrored([0,1,0]) {
        difference() {
            translate([-250+150/2,250,50-10])
            rotate([0,90,0])
            cylinder(150,50,50,center=true);

            translate([-250+150/2,250,50-10])
            rotate([0,90,0])
            cylinder(200,50-10,50-10,center=true);

            translate([0,0,500+40])
            cube(1000,center=true);
            
            translate([0,0,50])
            cube([600,500,100],center=true);
        }

        translate([-250+150/2, 250+50-10/2,50-10+20-0.01])
        cube([150,10,40],center=true);

        translate([-250+150/2, 250+50-10/2, 40+10/2+50/2])
        scale([1,1,.5]) {
            rotate([0,90,0])
            cylinder(200,15,15,center=true);
            
            util_mirrored([1,0,0])
            translate([100,0,0])
            sphere(15);
        }
    }
    
    util_mirrored([0,1,0])
    translate([-250,250+50-10/2, 84])
    mvm_tw_nacelle();
}

module mvm_tw_nacelle() {
    difference() {
        
        union() {
            util_saucer(1000,120,55);
            mirror([0,0,1])
            util_saucer(1000,120,15);
        }
        
        translate([500+.01,0,0])
        cube(1000,center=true);
    }

    util_saucer(500,120,55);
    mirror([0,0,1])
    util_saucer(500,120,15);
}

mvm_transwarp();