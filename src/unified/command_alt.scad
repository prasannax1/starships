use <disks.scad>
use <engine1.scad>
use <engine0.scad>
include <common.scad>;
use <../lib/util.scad>;
use <command.scad>;

module command_alt() {
    command_saucer();
    
    util_mirrored([0,1,0])
    translate([-disk_2_width/4+10,disk_2_width/4,0])
    class_1_assembly();
}

command_alt();