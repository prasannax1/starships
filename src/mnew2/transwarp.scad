use <../lib/util.scad>;
include <global.scad>;
include <transwarp_lib.scad>;



//saucer_position() saucer_basic();
//body_position() body_basic();

module tw_body() {
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
    }
}

module transwarp() {
    tw_disk();
    tw_body();
    tw_assembly();
}


module tw_assembly() {
    util_mirrored([0,1,0]) 
    nacelle_position()
    tw_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([-50,0,0])
        nacelle_position()
        sphere(d=8);

        translate([-150,0,0])
        nacelle_position()
        sphere(d=8);

        translate([-body_length/2+50,0,6])
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
    translate([100,nacelle_width/2-5,0])
    util_ovoid(200,30,nacelle_width*.5,36,30);
}

transwarp();