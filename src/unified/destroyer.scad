include <common.scad>
use <disks.scad>
use <engines.scad>
use <attack.scad>

module destroyer() {
    attack();
    
    translate([disk_1_width/4,0,0])        
    class_1_assembly();
    
    //translate([5,0,-disk_1_height*.75]) class_0_hangars();
}

destroyer();