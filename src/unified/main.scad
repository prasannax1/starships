use <disks.scad>
use <engines.scad>
use <warp.scad>
use <escort.scad>
use <../lib/util.scad>
include <common.scad>
use <saucer.scad>;
use <labs.scad>;
use <labs_secondary.scad>;
use <command.scad>;
use <scout_simple.scad>;
use <warp.scad>;

module main() {
    translate([disk_4_width/2+75,0,100+15+45-.01]) {
        saucer();
        
        translate([0,0,-.01])
        rotate(180)
        labs();
        
        translate([-disk_4_width/2+disk_2_width*.6,0,disk_4_height+10-.01])
        command_saucer();
    }
    
    class_4_body_new();
    
    util_mirrored([0,1,0])
    translate([-3.5*class_4_body_h+disk_1_width*.9,-class_4_body_h*.6,.7*disk_1_width/2+20-.01])
    rotate([45,0,0])
    class_5_secondary();
    
    translate([-class_4_nacelle_disp-disk_1_width/2, 0, 20-2.5])
    escort();
}

main();

