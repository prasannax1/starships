use <common.scad>;
use <command.scad>;
use <transwarp.scad>;
use <saucer.scad>;
use <scout.scad>;
use <carrier.scad>;
use <escort.scad>;
use <warp.scad>;

module full_sep() {
    distance=200;
    
    translate([distance,0, 0]) {
        saucer_pos() saucer();
        translate([2*distance,0, -distance])
        scout_pos() scout(saucer_attached=false);
    }
    
    translate([-distance, 0, 0]) {
        carrier_pos() carrier(tw_attached=false);
        
        translate([0,0,-distance])
        escort_pos() escort(carrier_attached=false);
        
        warp_pos()
        translate([0,distance,distance]) 
        warp();
    }
    
    translate([0,0,distance]) {
        transwarp();
        
        translate([0,0,distance])
        command_pos() command(tw_attached=false);
    }
}

full_sep();
