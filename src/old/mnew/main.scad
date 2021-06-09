use <../lib/util.scad>;
use <saucer.scad>;
use <transwarp.scad>;
use <carrier.scad>;
use <command.scad>;
use <scout.scad>;
use <escort.scad>;

module mother() {
    saucer_pos(true, true);
    transwarp();
    carrier();
    command_pos(true);
    scout_pos(true);
    escort_pos();
}


mother();