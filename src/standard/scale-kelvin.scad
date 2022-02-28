use <mother.scad>;
use <kelvin.scad>;
use <vengeance.scad>;


translate([-400,0,0]) mother();
translate([400,0,350]) vengeance();
translate([0,0,600]) kelvin();