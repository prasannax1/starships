use <../lib/util.scad>;
include <common.scad>;

use <scout.scad>;
use <scout_engine.scad>;

module scout_simple() {
    scout_saucer();
    difference() {
        translate([-20,0,18])
        scout_engine(180);
        
        translate([0,0,scout_width/2+3])
        cube(scout_width, center=true);
    }
}

scout_simple();