use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>

module labs_full() {
    disk_3();
    
    util_mirrored([0,1,0])
    translate([-disk_3_width*1.1, disk_3_body_width*.8, disk_3_height])
    //rotate([-90,0,0])
    class_3_nacelle();
    
    util_mirrored([0,1,0])
    translate([-disk_3_width*.75,disk_3_body_width/2,disk_3_height/4])
    rotate([30,0,0]) {
        cube([class_1_secondary_l/3, disk_3_body_width*.5, class_1_secondary_w/3], center=true);
        
        util_mirrored([1,0,0])
        translate([class_1_secondary_l/6,0,0])
        rotate([90,0,0])
        cylinder(h=disk_3_body_width*.5, d=class_1_secondary_w/3, center=true, $fn=16);
    }
}

labs_full();