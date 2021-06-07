use <../lib/util.scad>;
include <global.scad>;
include <escort_lib.scad>;


module escort_unpos() {
    difference() {
        scale([1,1,.3])
        rotate([0,90,0]) {
            sphere(d=escort_width);
            
            translate([0,0,-body_back/4-30/2])
            cylinder(d=escort_width, h=body_back/2-30, center=true);
        }

        util_mirrored([0,0,1])
        translate([0,0,saucer_width/2+10])
        cube(saucer_width, center=true);
        
        
        util_mirrored([0,0,1])
        translate([0,0,10])
        scale([1,1,.1])
        rotate([0,90,0]) {
            sphere(d=escort_width*3/4);

            translate([0,0,-body_back/4-10])
            cylinder(d=escort_width*3/4, h=body_back/2+20, center=true);
        }
        
        translate([escort_width/2,0,0])
        cube(20, center=true);
    }



    scale([1,1,.4])
    rotate([0,90,0]) {
        sphere(d=escort_width/2);

        translate([0,0,-body_back/4-20])
        cylinder(d=escort_width/2, h=body_back/2-20, center=true);
    }

    util_mirrored([0,1,0])
    translate([0, escort_width/2-5,-10])
    rotate([0,90,0])
    translate([0,0,-body_back/2+40])
    cylinder(d=20, h=body_back/3, center=true);
}

module escort() {
    translate([-body_length-escort_width/2-cr_rear_curve,0,-10])
    escort_unpos();
}

escort();