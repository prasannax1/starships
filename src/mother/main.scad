use <saucer.scad>
use <carrier.scad>
use <warp.scad>;
use <labs.scad>;
use <command.scad>;
include <common.scad>;

carrier();

saucer_pos() saucer();

labs_pos() labs();

command_pos() disk_2();

util_mirrored([0,1,0]) warp_pos() warp();