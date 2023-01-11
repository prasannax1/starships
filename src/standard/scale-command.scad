/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/command_full.scad>;
use <../unified/command_simple.scad>;
use <../unified/command_alt.scad>;
use <excelsior.scad>;
use <constitution-refit.scad>;

translate([50,0,100]) excelsior();

translate([75,0,0]) command_full();

translate([-180,0,-100]) command_simple();

translate([-360,0,0]) command_alt();

translate([-360,0,100]) constitution_refit();