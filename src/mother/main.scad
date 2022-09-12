use <saucer.scad>
use <carrier.scad>
use <warp.scad>;
use <labs.scad>;
use <command.scad>;
use <escort.scad>;
include <common.scad>;

module main() {
    carrier();
    saucer_pos() saucer();
    labs_pos() labs();
    labs_pos() cylinder(d=scout_width, h=labs_height+4, center=true);
    command_pos() disk_2();
    util_mirrored([0,1,0]) warp_pos() warp();
    escort_pos() escort();
}

main();