use <../lib/util.scad>;
include <common.scad>;

use <labs.scad>;
use <command_engine.scad>;

module labs_medium() {
    labs(show_hole=true);

    util_mirrored([0,1,0])
    translate([-labs_width/4, labs_width/4,-labs_height/2+.01])
    command_engine(180);
}

labs_medium();