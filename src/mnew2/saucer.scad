use <../lib/util.scad>;
include <global.scad>;
include <saucer_lib.scad>;


module saucer_disk_1() {
    saucer_position()
    hull()
    saucer_basic();
    
    saucer_position()
    translate([0,0,saucer_height])
    util_saucer_shape(scout_width, 7, 3, 1, 1);
    
    saucer_position()
    //hull()
    translate([0,0,saucer_height+7])
    util_saucer_shape(32, 3, 1, 1, 1);
}


module saucer_disk2() {
    difference() {
        saucer_disk_1();
        
        saucer_position() {
            cylinder(d=scout_width+4, h=4, center=true);
            cylinder(d1=scout_width+10, d2=scout_width-14, h=20, center=true);
        }
    }
}

module saucer_disk() {
    saucer_disk_1();
    
    difference() {
        hull() {
            saucer_position()
            cylinder(d=scout_width+20, h=body_height/2, center=true);
            cylinder(d=scout_width+20, h=body_height/2, center=true);
        }

        hull() {
            saucer_position()
            cylinder(d=scout_width-8, h=body_height/2+20, center=true);
            cylinder(d=scout_width-8, h=body_height/2+20, center=true);
        }
        
        

        translate([saucer_body_length,0,-body_height/4])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder(h=500, r=body_height/4-10, center=true, $fn=64);
        
        translate([0,0,saucer_body_length])
        cube(2*saucer_body_length, center=true);

        translate([-saucer_body_length,0,0])
        cube(2*saucer_body_length, center=true);
        
        saucer_position()
        translate([0,0,-(saucer_width-2*saucer_body_length)/2-10])
        cube(saucer_width-2*saucer_body_length, center=true);
    }
}







module saucer_body() {
    difference() {
        union() {


            hull() {
                body_position()
                body_basic();

            }
        }

        translate([-body_length*2+1,0,0])
        cube(body_length*4, center=true);
        
        translate([saucer_width/2-(saucer_width/2-saucer_body_length+30)/2,0,-40])
        cube([saucer_width/2-saucer_body_length+30,100,100], center=true);
        
        translate([saucer_width/2-(saucer_width/2-saucer_body_length+30),0,-body_height/4])
        scale([.5,1,1])
        sphere(d=40, $fn=64);
        
        translate([0,0,saucer_height/2 + 10])
        saucer_position()
        cylinder(d=saucer_width*1.5, h=saucer_height, center=true);
    }

    translate([0,0,-body_height/4])
    rotate([0,90,0])
    cylinder(d=100, h=4, center=true);
    

}

module saucer_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,saucer_nacelle_h/2])
    util_ovoid(saucer_nacelle_f, saucer_nacelle_b, saucer_nacelle_w, saucer_nacelle_h/2, saucer_nacelle_h/2);
}


module saucer() {
    saucer_disk();
    saucer_body();
    saucer_assembly();
}

module saucer_assembly() {
    util_mirrored([0,1,0])
    translate([0,body_width/2+saucer_nacelle_w/2, - saucer_nacelle_h-20])
    saucer_nacelle();

    translate([saucer_nacelle_f/2, 0, -saucer_nacelle_h-20])
    rotate([90,0,0])
    cylinder(d=25, h=body_width+saucer_nacelle_w, center=true, $fn=32);
}

saucer();