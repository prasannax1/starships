use <disks.scad>
use <engine2.scad>;
include <common.scad>;
use <../lib/util.scad>;
use <command.scad>;

module command_full() {
    translate([disk_2_width/2-.01,0,20-.01])
    command_saucer();
    
    class_2_secondary();
}

command_full();