include <common.scad>;
use <../lib/util.scad>;
use <scout_engine.scad>;
use <command.scad>;

module command_medium() {
    disk_2();

    util_mirrored([0,1,0])
    translate([-command_width/4, command_width/4, -scout_height])
    scout_engine();
}

command_medium();