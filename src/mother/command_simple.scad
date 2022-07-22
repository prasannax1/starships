use <../lib/util.scad>;
include <common.scad>;

use <command.scad>;
use <command_engine.scad>;

module command_simple() {
    disk_2();

    translate([-command_width/2+command_height,0,0])
    command_engine(180);
}

command_simple();