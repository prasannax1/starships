use <command.scad>;
use <secondaries.scad>;

translate([-100,0,0])
sec_body();

translate([100,0,0])
command_disk();
