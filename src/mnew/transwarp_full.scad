use <transwarp.scad>;
include <transwarp_lib.scad>;
use <command.scad>;
include <command_lib.scad>;
include <global_vars.scad>;

module tw_full() {
    tw();
    cm_pos();
}

tw_full();