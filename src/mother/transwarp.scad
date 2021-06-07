use <../lib/util.scad>;
include <global.scad>;
include <transwarp_lib.scad>;



//saucer_position() saucer_basic();
//body_position() body_basic();



module tw_body(saucer_attached=true) {
    difference() {
        intersection() {
            transwarp_position() 
            transwarp_basic();

            union() {
                translate([tw_body_width,0,0])
                scale([10,1,1])
                rotate(30)
                cylinder(h=5000, r=tw_body_width, $fn=6, center=true);
                    
                translate([tw_body_width,0,0])
                scale([1,.75,1])
                rotate(30)
                cylinder(h=5000, r=2*tw_body_width, $fn=6, center=true);
            }
        }

        saucer_position() {
            translate([0,0,saucer_height/2+10])
            cylinder(d1=saucer_width-2, d2=saucer_upper_width-2, h=saucer_height-10, center=true);

            translate([0,0,0])
            cylinder(d=saucer_width-2, h=30.2, center=true);
        }
        
        saucer_position()
        cylinder(r=command_width/2 + command_body_length, h=saucer_width, center=true, $fn=64);
        
    }
    
    translate([-body_length,0,5])
    util_saucer(1.2*body_back, tw_body_width*1.2, 20);
    
    difference() {
        hull()
        util_mirrored([0,0,1])
        intersection() {
            body_position()
            body_basic();


            tw_body_hexagon();
        }
                        
        translate([-1,0,0])
        saucer_position()
        cube(saucer_width, center=true);
        
        translate([0,0,saucer_width/2+1 ])
        cube(saucer_width, center=true);
        
        if (saucer_attached == false) {
            translate([0,0,-body_height/4])
            scale([.25,1,1])
            sphere(d=75);
        }
    }
}






module tw_disk() {
    difference() {
        hull()
        util_mirrored([1,0,0])
        translate([0,0,saucer_height-1])
        saucer_position()
        util_saucer_shape(transwarp_disk_w, 25, 15, 1,0);

        translate([-420, 0,0])
        cube(1000, center=true);
        
        saucer_position()
        cylinder(d=transwarp_disk_hole, h=saucer_width, center=true);
        
        saucer_position()
        translate([-275/2,0,0])
        cube([275,50,500],center=true);
        
        util_mirrored([0,1,0]) {
            translate([120, transwarp_disk_w/2, saucer_height + saucer_height/4])
            cube([40,50,15], center=true);

            translate([170, transwarp_disk_w/2, saucer_height + saucer_height/4])
            cube([40,50,15], center=true);

            translate([220, transwarp_disk_w/2, saucer_height + saucer_height/4])
            cube([40,50,15], center=true);

            translate([270, transwarp_disk_w/2, saucer_height + saucer_height/4])
            cube([40,50,15], center=true);
        }
    }
    
    translate([75,0,saucer_height*1.5])
    util_saucer_shape(100,7,2,5,0);

    translate([75,0,saucer_height*1.5  + 7])
    util_saucer_shape(32,3,1,3,0);
}

module transwarp(saucer_attached=true) {
    tw_disk();
    tw_body(saucer_attached);
    tw_assembly();
}


module tw_assembly() {
    util_mirrored([0,1,0]) 
    nacelle_position()
    tw_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([0,0,0])
        nacelle_position()
        sphere(d=8);

        translate([-100 ,0,0])
        nacelle_position()
        sphere(d=8);

        translate([-body_length/2+200,0,6])
        sphere(d=12);

        translate([-body_length/2-200,0,6])
        sphere(d=12);
    }

}


module tw_nacelle() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0,nacelle_width/2, nacelle_height/2])
    util_ovoid(nacelle_front, nacelle_back,nacelle_width,
    nacelle_height/2, nacelle_height/2);

    hull()
    util_mirrored([0,1,0])
    translate([200,nacelle_width/2-5,0])
    util_ovoid(200,30,nacelle_width*.75,36,30);
}

transwarp(saucer_attached=false);