/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/warp.scad>;
use <sovereign.scad>;
use <intrepid.scad>;

warp();

translate([0,0,200]) sovereign();
translate([-700,0,150]) intrepid();
