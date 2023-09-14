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

module main() {
    saucer();
    
    translate([0,0,-.01])
    labs();
    
    translate([-disk_4_width/2+disk_2_width*.6,0,disk_4_height+10-.01])
    command_saucer();
}

main();