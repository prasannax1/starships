use <disks.scad>
use <engine2.scad>
include <common.scad>
use <../lib/util.scad>
use <labs.scad>;

module labs_alt() {
    labs();
    
    translate([150,0,10]) {
        util_mirrored([0,0,1])
        util_mirrored([0,1,0])
        translate([-disk_3_width*.75, disk_3_body_width*.6, disk_3_height])
        //rotate([-90,0,0])
        class_2_nacelle();
        
        util_mirrored([0,1,0])
        translate([-disk_3_width*.75, disk_3_body_width*.6,0])
        cube([class_1_secondary_l/4, class_1_secondary_w/8, disk_3_height*2], center=true);
        
        translate([-disk_3_width*.75,0,0])
        cube([class_1_secondary_l/4, disk_3_body_width*1.2, class_1_secondary_w/4], center=true);
    }
}

labs_alt();