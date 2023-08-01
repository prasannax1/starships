use <../unified/main.scad>;
use <../unified/escort.scad>;
use <../unified/scout_simple.scad>;
use <../unified/scout_alt.scad>;
use <../unified/scout_full.scad>;
use <../unified/command_simple.scad>;
use <../unified/command_alt.scad>;
use <../unified/command_full.scad>;
use <../unified/labs_full.scad>;
use <../unified/saucer.scad>;
use <../unified/carrier.scad>;
use <../unified/warp.scad>;

translate([-300,0,-450]) main();

translate([0,0,550]) escort();

translate([0,0,500]) scout_simple();
translate([-250,0,500]) scout_full();
translate([-450,0,500]) scout_alt();

translate([50,0,400]) command_simple();
translate([-320,0,400]) command_alt();
translate([-750,0,400]) command_full();

translate([0,0,280]) labs_full();

translate([0,0,150]) saucer();

translate([0,0,0]) carrier();

translate([0,0,-200]) warp();