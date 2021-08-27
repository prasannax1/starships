use <common.scad>;
use <saucer.scad>;
use <carrier.scad>;
use <transwarp.scad>;
use <command.scad>;
use <scout.scad>;
use <escort.scad>;
use <warp.scad>;

module mother() {
    saucer();
    carrier();
    transwarp();
    nacelle_pos() warp();
    command();
    scout();
    escort();
}

mother();  