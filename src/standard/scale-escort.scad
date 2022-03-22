/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/escort.scad>;
use <defiant.scad>;


translate([0,0,0]) escort();

translate([0,0,50]) defiant();