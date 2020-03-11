use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_combined() {
    translate([100,0,100]) mvm_saucer();
    translate([100,0,100+80-.01]) mvm_command();
    translate([-350,0,-30+.01]) mvm_transwarp();
    translate([100,0,100-3.5+.01]) mvm_escort();
}

mvm_total_assembly_combined();

module mother() {
    mvm_total_assembly_combined();
}