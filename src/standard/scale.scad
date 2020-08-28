/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/mlib.scad>;
use <constitution.scad>;
use <excelsior.scad>;
use <galaxy.scad>;
use <sovereign.scad>;

mother();

translate([0,0,680]) constitution();

translate([0,0,540]) excelsior();

translate([0,0,400]) galaxy();

translate([0,0,200]) sovereign();