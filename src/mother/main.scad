use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_combined() {
    mvm_saucer();
    translate([0,0,80-.01]) mvm_command();
    translate([-750/2+.01,0,+.01]) mvm_transwarp();    
    translate([0,0,-10+.01]) mvm_escort();
}

mvm_total_assembly_combined();

module mother() {
    mvm_total_assembly_combined();
}