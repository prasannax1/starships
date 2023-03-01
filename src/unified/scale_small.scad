use <attack.scad>;
use <diplomat.scad>;
use <yacht.scad>;
use <science.scad>;



translate([-50,0,0])attack();
translate([0,-50,0]) diplomat();
translate([0,50,0]) science();
translate([50,0,0]) yacht();