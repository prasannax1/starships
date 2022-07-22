/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/command_full.scad>;
use <../mother/command_simple.scad>;
use <../mother/command_medium.scad>;
use <excelsior.scad>;
use <constitution-refit.scad>;


translate([0,0,0]) command();

translate([0,0,100]) command_simple();

translate([0,0,160]) command_medium();

translate([75,0,-60]) constitution_refit();