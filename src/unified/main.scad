use <disks.scad>
use <engines.scad>
use <warp.scad>
use <escort.scad>
use <../lib/util.scad>
include <common.scad>
use <saucer.scad>;
use <labs.scad>;
use <command.scad>;
use <scout_simple.scad>;
use <warp.scad>;

module main() {
    translate([disk_4_width/2+75,0,100+15+45-.01]) {
        saucer();
        
        translate([0,0,-.01])
        labs();
        
        translate([-disk_4_width/2+disk_2_width*.6,0,disk_4_height+10-.01])
        command_saucer();
    }
    
    class_4_body_new();
    
    util_mirrored([0,1,0])
    translate([-class_4_nacelle_disp*.75,class_4_body_w/4,20+class_4_nacelle_base_w/2-.01])
    rotate([-45,0,0])
    class_5_secondary();
}

main();
