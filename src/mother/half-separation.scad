use <common.scad>;
use <command.scad>;
use <transwarp.scad>;
use <saucer.scad>;
use <scout.scad>;
use <carrier.scad>;
use <escort.scad>;
use <warp.scad>;

module half_sep() {
    distance=100;
    
    translate([distance,0, 0]) {
        saucer();
        scout();
    }
    
    translate([-distance, 0, 0]) {
        carrier();
        escort();
    }
    
    translate([0,0,distance]) {
        transwarp(saucer_attached=false);
        command();
        nacelle_pos() warp();
    }
}

half_sep();
