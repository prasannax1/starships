use <shuttlepod.scad>;
use <shuttle-small.scad>;
use <shuttle-medium.scad>;
use <shuttle-large.scad>;
use <fighter.scad>;
use <runabout.scad>;
use <tactical-runabout.scad>;

pod();

translate([0,0,-4]) small_shuttle();

translate([0,0,-8]) medium_shuttle();

translate([0,0,-12]) large_shuttle();

translate([0,0,-16]) fighter();

translate([0,0,-22]) runabout();

translate([0,0,-28]) tactical();
