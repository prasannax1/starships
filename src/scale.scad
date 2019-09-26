use <attack.scad>;
use <diplomatic.scad>;
use <scout.scad>;
use <science.scad>;
use <hospital.scad>;
use <mother.scad>;
use <macs.scad>;
use <tactical-runabout.scad>;

translate([0,0,0]) {
m_main_sep();
translate([0,0,90]) rotate(0) scout();
translate([0,0,120]) hospital();
translate([0,0,150]) science();
translate([-30,0,180]) rotate(0) attack();
translate([30,0,180]) rotate(180) tactical();
translate([0,0,210]) rotate(0) diplomat();
translate([0,0,240]) macs_heavy_runabout();
translate([0,0,260]) macs_fast_shuttle();
translate([30,0,280]) macs_large_shuttle();
translate([0,0,280]) macs_small_shuttle();
translate([-30,0,280]) macs_pod();

}