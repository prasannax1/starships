include <common.scad>
use <disks.scad>
use <engines.scad>

module scout_simple() {
    disk_1();
    
    translate([-disk_1_width/4,0,0])
    class_0_secondary();

    translate([-disk_1_width*.35,0,0])
    class_1_neck();

    translate([-disk_1_width/2,0,-disk_1_height*1.25])
    class_1_nacelle();
}

scout_simple();