use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <transwarp_lib.scad>;


module mvm_total_assembly_combined() {
    translate([-11,0,0-.01]) mvm_saucer();
    translate([-750/2+.01,0,+.015]) mvm_transwarp_full();    
    translate([-11,0,+.01]) mvm_escort();
}

mvm_total_assembly_combined();

module mother() {
    mvm_total_assembly_combined();
}