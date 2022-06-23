use <../lib/util.scad>;
include <common.scad>;

use <labs.scad>;
use <command_engine.scad>;

module labs_medium() {
    labs(show_hole=true);

    util_mirrored([0,1,0])
    translate([-labs_width/3, labs_width/4,0])
    command_engine();
}

labs_medium();