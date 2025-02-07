include <common.scad>
use <disk1.scad>
use <engine1.scad>

module scout_full() {
    translate([disk_1_width/2,0,disk_1_height+class_1_secondary_w/2-class_1_neck_w*.6-3])
    disk_1();
    
    class_1_secondary();
}

scout_full();