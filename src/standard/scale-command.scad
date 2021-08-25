/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/command.scad>;
use <excelsior.scad>;


translate([-0,0,-90])
command(tw_attached=false);

translate([0,0,120]) excelsior();