use <saucer.scad>;
use <carrier.scad>;
use <transwarp.scad>;
use <command.scad>;
use <scout.scad>;
use <escort.scad>;

module mother() {
    saucer();
    carrier();
    transwarp();
    command();
    scout();
    escort();
}

mother();  