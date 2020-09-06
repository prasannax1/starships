/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../mother/mlib.scad>;
use <constitution.scad>;


render() mvm_escort();

translate([100,0,120]) constitution();