/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/labs.scad>;
use <../mother/labs_full.scad>;
use <odyssey.scad>;


translate([0,0,-100])
labs_full();

labs();

translate([200,0,150]) odyssey();