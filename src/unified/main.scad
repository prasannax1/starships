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
    
    translate([-disk_2_width/2-disk_4_upper/2,0,disk_4_height-6-.5]) command_saucer();
    
    carrier();
    
    util_mirrored([0,1,0])
    translate([-disk_4_width-10,class_4_nacelle_disp+.2*disk_1_width-.01,disk_1_width/3-20])
    warp();
    
    translate([-class_4_tail_l+disk_1_width, 0, -3-10])
    escort();
}

main();