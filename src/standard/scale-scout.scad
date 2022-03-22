/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/scout.scad>;
use <constitution.scad>;
use <equinox.scad>;


scout(saucer_attached=false);

translate([0,0,80]) constitution();

translate([-40,0,-80]) equinox();