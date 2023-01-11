use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>

module labs_full() {
    disk_3();
    
    util_mirrored([0,1,0])
    translate([-disk_3_width*1, disk_3_body_width*.8, disk_3_height/4])
    //rotate([-90,0,0])
    class_3_nacelle();
    
    translate([-disk_3_width*.75,0,disk_3_height/4])
    cube([class_1_secondary_l/3, disk_3_body_width*1.6, class_1_secondary_w/3], center=true);
}

labs_full();