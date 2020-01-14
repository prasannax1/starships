use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <hangar.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_combined() {
    mvm_main_disk_assembly();
    translate([0,0,30-.01]) mvm_command();
    translate([0,0,-30+.01]) mvm_transwarp();
    translate([-750/2,0,-30+.01]) mvm_back_hangar();
    translate([0,0,-30-20+.01]) mvm_escort();
}

mvm_total_assembly_combined();

module mother() {
    mvm_total_assembly_combined();
}