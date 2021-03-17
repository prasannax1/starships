use <../lib/util.scad>;
include <saucer_lib.scad>;
include <scout_lib.scad>;

module sauce_disk() {
    difference() {
        union() {
            util_ovoid(saucer_width/2, saucer_width/2, saucer_width,saucer_height_ext, 3);
            
            hull() {
                translate([0,0,saucer_height/2])
                cylinder(h=saucer_height-.01, d=saucer_neck_width, center=true);

                translate([-saucer_width/2-saucer_neck_width/2,0,saucer_height])
                sphere(d=saucer_neck_width);


                translate([-saucer_width/2-saucer_neck_width/2,0,saucer_neck_width/2])
                sphere(d=saucer_neck_width);
            }
        }

        translate([0,0,saucer_width*1.5/2+saucer_height+.01])
        cube(saucer_width*1.5, center=true);
        
        translate([saucer_width/2,0,s_deflector_width/2])
        cube([s_deflector_width, s_deflector_width, s_deflector_width/4], center=true);
    }
}


module saucer() {
    sauce_disk();
    sauce_assembly();
}

module saucer_pos(scout_attached=false, transwarp_attached=false) {
    difference() {
        translate([saucer_width/2, 0,0])
        saucer();
        
        translate([saucer_width/2, 0, -3])
        cylinder(h=4, d=sc_disk_width+4, center=true);
        
        if (scout_attached==false) {
            translate([saucer_width/2, 0, -3])
            util_ovoid(sc_disk_width/2, sc_disk_width/2, sc_disk_width, sc_disk_height_ext, sc_disk_height_ext);
        }
        
        if (transwarp_attached == false) {
            translate([saucer_width/2,0,saucer_height])
            difference() {
                cylinder(d=40, h=8, center=true);
                cylinder(d=32, h=12, center=true);
            }
        }
    }
}




module sauce_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,saucer_nacelle_w/4,0])
    util_ovoid(saucer_nacelle_f, saucer_nacelle_b, saucer_nacelle_w/2, saucer_nacelle_h/2, saucer_nacelle_h/2);
}


module sauce_assembly() {
    translate([0,0,saucer_height/2])
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([saucer_nacelle_x,saucer_nacelle_y,saucer_nacelle_z])
    sauce_nacelle();

    translate([0,0,saucer_height/2])
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    hull() {
        translate([saucer_nacelle_x+10,0,0])
        rotate([0,90,0])
        cylinder(r=3, h=30, $fn=10, center=true);

        translate([saucer_nacelle_x+10,saucer_nacelle_y,saucer_nacelle_z])
        rotate([0,90,0])
        cylinder(r=3, h=30, $fn=10, center=true);
    }
}

saucer_pos(false, false);