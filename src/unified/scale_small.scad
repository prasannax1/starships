use <attack.scad>;
use <diplomat.scad>;
use <yacht.scad>;
use <science.scad>;
use <heavy_runabout.scad>;

translate([-20,0,0])heavy_runabout();
translate([-75,0,0])attack();
translate([0,-36,0]) diplomat();
translate([0,38,0]) science();
translate([30,0,0]) yacht();