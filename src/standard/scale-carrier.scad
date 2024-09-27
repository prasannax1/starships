/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/carrier.scad>;
use <galaxy.scad>;
use <sovereign.scad>;
use <excelsior.scad>;


carrier(true);

translate([-0,0,180]) 
    difference() {
        carrier(true);
        translate([0,-1000,0])
        cube(2000, center=true);
    }


translate([-55,0,130]) color("gray") sovereign();

