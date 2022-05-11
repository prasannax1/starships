use <../mother/main.scad>;
use <kelvin.scad>;
use <vengeance.scad>;


translate([-400,0,-50]) main();
translate([400,0,350]) vengeance();
translate([0,0,600]) kelvin();