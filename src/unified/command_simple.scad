use <disks.scad>
use <engines.scad>;
include <common.scad>;

module command_simple() {
    disk_2();
    
    translate([-class_2_nacelle_l/2,0,1.5*disk_2_height])
    class_2_nacelle();
    
    hull() {
        translate([-disk_2_width/4, 0, disk_2_height/3])
        sphere(d=6);
        
        translate([-disk_2_width/2+10, 0, disk_2_height/3])
        sphere(d=6);
        
        translate([-class_2_nacelle_l/2-class_0_secondary_l/3,0,1.5*disk_2_height])
        sphere(d=2);
    }
}

command_simple();