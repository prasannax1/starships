use <scout.scad>;
use <scout_secondary.scad>;

module scout() {
    scout_saucer();
    scout_secondary();
}

module scout_full() {
    scout_saucer();
    scout_secondary();
}

scout();