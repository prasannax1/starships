use <../small/science.scad>;
use <../standard/constitution-refit.scad>;
use <../standard/equinox.scad>;

translate([0,0,75])
rotate(30)
science();


translate([0,0,0])
rotate(-30)
equinox();
