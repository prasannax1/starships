use <../lib/util.scad>;
include <common.scad>;

use <scout.scad>;
use <scout_engine.scad>;

module scout_simple() {
    scout_saucer();
    translate([-32,0,9])
    scout_engine(0);
}

scout_simple();