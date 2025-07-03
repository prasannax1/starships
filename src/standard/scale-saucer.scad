/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/saucer.scad>;
use <galaxy.scad>;
use <sovereign.scad>;
use <odyssey.scad>;
use <constitution-refit.scad>;


saucer();

translate([250,0,-100]) odyssey();

translate([50,0,120]) constitution_refit();

