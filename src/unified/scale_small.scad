use <attack.scad>;
use <diplomat.scad>;
use <yacht.scad>;
use <science.scad>;
use <heavy_runabout.scad>;

heavy_runabout();

translate([-75,0,0])attack();
translate([0,-50,0]) diplomat();
translate([0,50,0]) science();
translate([50,0,0]) yacht();