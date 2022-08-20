use <../lib/util.scad>;
include <common.scad>;

use <labs.scad>;
use <command_engine.scad>;

module labs_medium() {
    labs(show_hole=true);

    util_mirrored([0,1,0])
    translate([-labs_width/2, labs_width/2-labs_height,-labs_height/2+.01])
    command_engine(135, 2);
    
    util_mirrored([0,1,0])
    translate([-labs_width/2, labs_width/2-labs_height,labs_height/4-5])
    mirror([0,0,1])
    command_engine(135, 2);
}

labs_medium();