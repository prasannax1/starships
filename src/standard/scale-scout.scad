/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/scout_full.scad>;
use <../unified/scout_alt.scad>;
use <constitution.scad>;
use <equinox.scad>;

translate([0,0,80]) scout_alt();

scout_full();

translate([20,0,-50]) constitution();