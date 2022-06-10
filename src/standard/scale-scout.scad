/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/scout_full.scad>;
use <constitution.scad>;
use <equinox.scad>;


scout_full();

translate([-40,0,-80]) equinox();