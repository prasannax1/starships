use <command.scad>;
use <transwarp.scad>;
use <saucer.scad>;
use <scout.scad>;
use <carrier.scad>;
use <escort.scad>;

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
        transwarp();
        command();
    }
}

half_sep();
