use <labs.scad>;
use <secondaries.scad>;

translate([200,0,0])
labs_disk(command_attached=false, saucer_attached=false);

translate([-100,0,0])
sec_body();