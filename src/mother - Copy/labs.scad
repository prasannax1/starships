use <../lib/util.scad>;
include <common.scad>;
use <secondaries.scad>;


module labs_disk_plus() {
    disk_3();
    translate([-command_width/2,0,labs_height-.01]) disk_0();

    difference() {
        intersection() {
            difference() {
                cylinder(d=labs_width, h= 5*labs_height, $fn=faces_concave, center=true);
                
                cylinder(d=command_width, h= 6*labs_height, $fn=faces_rough, center=true);
            }


            translate([0,0,labs_height*5/2])
            cube([80, labs_width*1.5, labs_height*5], center=true);
        }

        translate([0,0,.5*1.5*labs_width+labs_height+.01])
        cube(1.5*labs_width, center=true);
        
    }
}

module labs_disk_minus() {
    util_mirrored([0,1,0])
    translate([0,labs_width/2,labs_height/2])
    hull()
    util_mirrored([0,0,1])
    util_mirrored([1,0,0])
    translate([35,0,8])
    rotate([90,0,0])
    cylinder(d=2, h=8, $fn=12, center=true);
    
    translate([-labs_width/2,0,0])
    scale(.99)
    hex();
}

module labs_disk() {
    difference() {
        labs_disk_plus();
        labs_disk_minus();
    }
}

module labs() {
    labs_disk();
    translate([-labs_width/2,0,0]) sec_body();
}

labs_disk();
    