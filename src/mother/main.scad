use <../lib/util.scad>;
include <common.scad>;
use <carrier.scad>;
use <saucer.scad>;
use <transwarp.scad>;
use <command.scad>;
use <warp.scad>;
use <escort.scad>;
use <scout.scad>;

module mother() {
    carrier_pos() carrier();
    saucer_pos() saucer();
    transwarp();
    command_pos() command();
    warp_pos() warp();
    escort_pos() escort();
    scout_pos() scout();
}

mother();  