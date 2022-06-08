use <common.scad>;
use <command_secondary.scad>;

module command() {
    command_pos() disk_2();
    command_secondary();
}

disk_2();