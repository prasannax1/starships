use <scout.scad>;
use <scout_secondary.scad>;
include <common.scad>;

module scout() {
    scout_pos() 
    scout_saucer();
    scout_secondary();
}

module scout_full() {
    scout();
}

scout();