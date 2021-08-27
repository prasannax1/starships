use <common.scad>;
use <command.scad>;
use <transwarp.scad>;
use <saucer.scad>;
use <scout.scad>;
use <carrier.scad>;
use <escort.scad>;
use <warp.scad>;

module full_sep() {
    distance=100;
    
    translate([distance,0, 0]) {
        saucer();
        translate([0,0, -distance])
        scout(saucer_attached=false);
    }
    
    translate([-distance, 0, 0]) {
        carrier();
        
        translate([0,0,-distance])
        escort();
    }
    
    translate([0,0,distance]) {
        transwarp(saucer_attached=false);
        
        translate([0,0,distance])
        command(tw_attached=false);
        
        nacelle_pos() translate([0,distance,distance]) warp();
    }
}

full_sep();
