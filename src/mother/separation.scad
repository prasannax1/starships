use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_separate() {
    mvm_saucer();
    translate([50,0,120]) mvm_command();
    translate([-500,0,-50]) mvm_transwarp();
    translate([25,0,-75]) mvm_escort();
}

mvm_total_assembly_separate();

module m_main_sep() {
    mvm_total_assembly_separate();
}