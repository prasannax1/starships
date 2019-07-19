use <attack.scad>;
use <diplomatic.scad>;
use <scout.scad>;
use <science.scad>;
use <hospital.scad>;
use <mother.scad>;

m_main_sep();

translate([0,0,90]) rotate(0) scout();
translate([0,0,150]) hospital();
translate([0,0,180]) science();
translate([0,0,210]) rotate(0) attack();
translate([0,0,240]) rotate(0) diplomat();
