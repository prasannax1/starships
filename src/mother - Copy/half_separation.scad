use <../lib/util.scad>;
include <common.scad>;
use <carrier.scad>;
use <saucer.scad>;
use <scout.scad>;
use <labs.scad>;
use <command.scad>;
use <warp.scad>;
use <secondaries.scad>;
use <escort.scad>;

module main() {
    carrier();

    translate([200,0,0]) {
        saucer_pos() saucer(scout_attached=false);

        saucer_pos() translate([0,0,-labs_height-command_height+.02 -50]) scout_saucer();
        
        saucer_pos() translate([-150,0,-labs_height-command_height+.02 -50]) scout_secondary_hull();

        saucer_pos() translate([0,0,saucer_height-.01 + 50]) labs_disk(saucer_attached=false, command_attached=false);

        saucer_pos() translate([0,0,saucer_height+labs_height-.02 + 100]) command_disk();
    }

    util_mirrored([0,1,0]) warp_pos(carrier_theta) translate([0,0,100]) warp();
    
     util_mirrored([0,1,0]) warp_pos(carrier_theta) translate([-warp_length/2,0,250]) sec_body();
    
    translate([-carrier_width*2+hangar_width/2,0,10+.01 + 100]) escort(carrier_attached=false);
}

main();