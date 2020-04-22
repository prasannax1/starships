use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <transwarp.scad>;


module mvm_total_assembly_separate() {
    translate([300-11,0,-20]) mvm_saucer();
    translate([-400,0,-0]) mvm_transwarp();
    translate([0,0,-100]) mvm_escort();
}

mvm_total_assembly_separate();

module m_main_sep() {
    mvm_total_assembly_separate();
}