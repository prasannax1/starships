use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_separate() {
    mvm_saucer();
    translate([250,0,100]) mvm_command();
    translate([-350,0,-100]) mvm_transwarp();
    translate([250,0,-100]) mvm_escort();
}

mvm_total_assembly_separate();

module m_main_sep() {
    mvm_total_assembly_separate();
}