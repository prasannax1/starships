use <../lib/util.scad>;
include <common.scad>;

use <scout.scad>;
use <scout_engine.scad>;

module scout_simple() {
    scout_saucer();
    translate([-25,0,9])
    scout_engine(180);
}

scout_simple();