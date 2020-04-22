use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <transwarp.scad>;


module mvm_total_assembly_combined() {
    translate([500,0,0]) mvm_saucer();
    translate([-400,0,-0+.01]) mvm_transwarp();
    translate([500,0,0+.01]) mvm_escort();
}

mvm_total_assembly_combined();

module mother() {
    mvm_total_assembly_combined();
}