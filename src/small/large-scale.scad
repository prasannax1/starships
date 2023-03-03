use <../unified/attack.scad>;
use <../unified/science.scad>;
use <../unified/diplomat.scad>;

translate([0,40,0]) attack();

translate([0,-40,0]) science();

translate([75,0,0]) diplomat();