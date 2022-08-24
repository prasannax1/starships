/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/labs_medium.scad>;
use <../mother/labs_full.scad>;
use <odyssey.scad>;


labs_medium();

translate([200,0,150]) odyssey();