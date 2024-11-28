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
use <carrier.scad>;

module main() {
    saucer();
    
    translate([0,0,0]) labs();
    
    translate([-500,0,-6]) command_saucer();
    
    carrier();
    
    util_mirrored([0,1,0])
    translate([-disk_4_width-10,class_4_nacelle_disp+.2*disk_1_width-.01,disk_1_width/3-20])
    warp();
    
    translate([-class_4_tail_l+disk_1_width, 0, -3-15])
    escort();
}

main();