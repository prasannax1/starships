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

translate([-0,0,-380]) main();

translate([0,0,550]) escort(carrier_attached=false);

translate([0,0,500]) scout_simple();
translate([-250,0,500]) scout_full();
translate([-450,0,500]) scout_alt();

translate([0,0,400]) command_simple();
translate([-320,0,400]) command_medium();
translate([-750,0,400]) command();

translate([0,0,275]) labs();

translate([0,0,140]) saucer();

translate([0,0,75]) carrier(true);

translate([0,0,-200]) warp();
