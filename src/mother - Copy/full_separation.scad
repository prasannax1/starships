use <../lib/util.scad>;
include <common.scad>;
use <carrier.scad>;
use <saucer.scad>;
use <saucer_full.scad>;
use <scout.scad>;
use <labs.scad>;
use <command.scad>;
use <warp.scad>;
use <secondaries.scad>;
use <escort.scad>;

module main() {
    carrier();

    translate([200,0,100]) {
        saucer_pos() saucer_full();

        saucer_pos() translate([0,0,-labs_height-command_height+.02 -100]) scout();

        saucer_pos() translate([0,0,saucer_height-.01 + 150]) labs();

        saucer_pos() translate([0,0,saucer_height+labs_height-.02 + 250]) command();
    }

    warp_pos(carrier_theta) translate([0,0,100]) warp();
        
    translate([-carrier_width*2+hangar_width/2-250,0,10+.01 + 100]) escort(carrier_attached=false);
}

main();