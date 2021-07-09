/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/scout.scad>;
use <constitution.scad>;


scout(saucer_attached=false);

translate([400,0,90]) constitution();