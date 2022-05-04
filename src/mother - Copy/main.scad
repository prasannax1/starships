use <../lib/util.scad>;
include <common.scad>;
use <carrier.scad>;
use <saucer.scad>;
use <scout.scad>;
use <labs.scad>;
use <command.scad>;
use <warp.scad>;
use <secondaries.scad>;

module main() {
    carrier();

    saucer_pos() saucer(scout_attached=true);

    saucer_pos() translate([0,0,-labs_height-command_height+.02]) scout_saucer();

    saucer_pos() translate([0,0,saucer_height-.01]) labs_disk();

    saucer_pos() translate([0,0,saucer_height+labs_height-.02]) command_disk();

    util_mirrored([0,1,0]) warp_pos(carrier_theta) translate([0,0,0]) warp();
}

main();