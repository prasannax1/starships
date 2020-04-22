//use <perf.scad>;
use <color.scad>;


c_m_main_sep();

translate([-120,0,60]) {
    translate([100,0,210]) c_scout();
    translate([50,0,240]) c_hospital();
    translate([-30,0,150]) c_science();
    translate([30,0,150]) c_runabout();
    translate([-30,0,180]) c_attack();
    translate([50,0,180]) c_tactical();
    translate([0,0,210]) c_diplomat();
    translate([0,0,240]) c_macs_heavy_runabout();
    translate([0,0,260]) c_macs_fast_shuttle();
    translate([30,0,280]) c_macs_large_shuttle();
    translate([0,0,280]) c_macs_small_shuttle();
    translate([-30,0,280]) c_macs_pod();
}
