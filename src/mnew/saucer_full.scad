use <saucer.scad>;
use <scout.scad>;

module sauc_full() {
    sauc_final(tw_attached=false, sc_attached=true);
    sc_pos();
}

sauc_full();