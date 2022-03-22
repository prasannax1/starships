use <common.scad>;
use <command.scad>;
use <transwarp.scad>;
use <saucer.scad>;
use <scout.scad>;
use <carrier.scad>;
use <escort.scad>;
use <warp.scad>;

module half_sep() {
    distance=200;
    
    translate([distance,0, 0]) union() {
        saucer_pos() saucer();
        scout_pos() scout();
    }
    
    translate([-distance, 0, 0]) union() {
        carrier_pos() carrier();
        escort_pos() escort();
        warp_pos() warp();
    }
    
    translate([0,0,distance*1.5]) union() {
        transwarp();
        command_pos() command();
    }
}

half_sep();
