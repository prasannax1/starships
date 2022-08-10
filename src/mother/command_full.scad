include <common.scad>;
use <../lib/util.scad>;

use <command_secondary.scad>;
use <scout_simple.scad>;

module command() {
    translate([1*command_width, 0, -command_height/2-.01])
    disk_2();
    command_secondary();
}

module command_half() {
    translate([1*command_width, 0, -command_height/2-.01])
    disk_2(standalone=true);
    command_secondary();
}

module command_dread() {
    translate([1*command_width, 0, -command_height/2-.01+9])
    scout_simple();
    translate([1*command_width, 0, -command_height/2-.01])
    disk_2(standalone=true);
    command_secondary();
}

command();