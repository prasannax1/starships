/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/mlib.scad>;
use <excelsior.scad>;


translate([0,0,-90])
mvm_command_single();

translate([0,0,120]) excelsior();