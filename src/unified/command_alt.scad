use <disks.scad>
use <engines.scad>;
include <common.scad>;
use <../lib/util.scad>;

module command_alt() {
    disk_2();
    
    util_mirrored([0,1,0])
    rotate([50,0,0]) {
        translate([-class_2_nacelle_l/2,0,1.5*disk_2_height])
        rotate([-50,0,0])
        class_1_nacelle();
        
        hull() {
            translate([-disk_2_width/4+10, 0, disk_2_height/3])
            sphere(d=6);
            
            translate([-disk_2_width/2+20, 0, disk_2_height/3])
            sphere(d=6);
            
            translate([-class_2_nacelle_l/2-class_0_secondary_l/3,0,1.5*disk_2_height])
            sphere(d=2);
        }
    }
}

command_alt();