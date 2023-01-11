use <disks.scad>
use <engines.scad>
use <warp.scad>
use <escort.scad>
use <../lib/util.scad>
include <common.scad>

module main() {
    class_4_body();
    
    translate([disk_4_width/2-.01,0,0]) {
        disk_4();
        
        translate([0,0,disk_4_height-.01]) {
            disk_3();
            
            translate([0,0, disk_3_height/2 - .01]) {
                disk_2();
            }
        }
    }
    
    util_mirrored([0,1,0])
    translate([-class_4_body_l, class_4_nacelle_sep/2, disk_4_height-.05])
    translate([class_4_nacelle_l*.4,0,class_4_nacelle_w*.4+10])
    warp();
    
    translate([-class_4_body_l/2,0,disk_4_height-3.1])
    escort();
    
}

main();