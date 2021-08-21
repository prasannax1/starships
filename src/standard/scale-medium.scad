use <equinox.scad>;
use <danube.scad>;
use <../small/attack.scad>;
use <../small/science.scad>;
use <../small/diplomat.scad>;

equinox();
translate([0,0,60]) attack();

translate([0,0,90]) science();

translate([0,0,120]) diplomat();

translate([0,0,140]) danube();

