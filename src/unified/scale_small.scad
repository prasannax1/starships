use <attack.scad>;
use <diplomat.scad>;
use <yacht.scad>;
use <science.scad>;
use <heavy_runabout.scad>;
use <mini_escort.scad>;
use <reverse_yacht_small.scad>;
use <reverse_yacht.scad>;

heavy_runabout();

translate([-75,0,0])attack();
translate([-80,50,0])mini_escort();
translate([-80,-50,0])reverse_yacht_small();
translate([0,-50,0]) diplomat();
translate([0,50,0]) science();
translate([60,25,0]) yacht();
translate([60,-25,0]) reverse_yacht();