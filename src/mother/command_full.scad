include <common.scad>;
use <../lib/util.scad>;

use <command_secondary.scad>;

module command() {
    translate([0.8*command_width, 0, command_height-.01])
    disk_2();
    command_secondary();
}

module command_half() {
    translate([0.8*command_width, 0, command_height-.01])
    disk_2(standalone=true);
    command_secondary();
}

command();