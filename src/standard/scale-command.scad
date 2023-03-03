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
use <sovereign.scad>;

translate([0,0,100]) excelsior();

translate([0,0,0]) command_full();

translate([100,0,-100]) sovereign();

