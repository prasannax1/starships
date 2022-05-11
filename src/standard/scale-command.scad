/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/command.scad>;
use <excelsior.scad>;
use <constitution-refit.scad>;


translate([0,0,0])
command();

translate([0,0,100]) excelsior();

translate([0,0,-60]) constitution_refit();