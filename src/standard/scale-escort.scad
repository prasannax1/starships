/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/mlib.scad>;
use <defiant.scad>;


render() mvm_escort();

translate([75,0,50]) defiant();