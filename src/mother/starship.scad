use <../lib/util.scad>;
use <scout.scad>;
use <transwarp.scad>;
use <escort.scad>;


module mvm_total_assembly_transwarp() {
    mvm_transwarp();
    mvm_command();
    translate([0,0,-20+.01])
    mvm_escort();
}

mvm_total_assembly_transwarp();