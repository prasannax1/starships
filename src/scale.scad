use <attack_ship.scad>;
use <diplomatic_yacht.scad>;
use <explorer_ship.scad>;
use <hospital.scad>;
use <mother_ship.scad>;

mothership();

translate([0,0,120]) rotate(90) explorer();
translate([0,0,180]) hospital();
translate([0,0,240]) rotate(-90) diplomat();
translate([0,0,300]) rotate(180) attack();