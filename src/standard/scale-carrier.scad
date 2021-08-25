/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/carrier.scad>;
use <galaxy.scad>;
use <sovereign.scad>;


carrier();

translate([-500,0,100]) sovereign();

