/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/main.scad>;
use <../mother/scout_full.scad>;
use <../mother/scout_simple.scad>;
use <../mother/command.scad>;
use <../mother/command_simple.scad>;
use <../mother/command_medium.scad>;
use <../mother/labs.scad>;
use <../mother/saucer.scad>;
use <../mother/carrier.scad>;
use <../mother/escort.scad>;
use <../mother/warp.scad>;

translate([-400,0,-500]) main();

translate([0,0,550]) escort(carrier_attached=false);

translate([0,0,500]) scout_simple();
translate([-250,0,500]) scout_full();

translate([0,0,400]) command_simple();
translate([-320,0,400]) command_medium();
translate([-600,0,400]) command();

translate([0,0,280]) labs();

translate([0,0,140]) saucer();

translate([0,0,0]) carrier();

translate([0,0,-250]) warp();