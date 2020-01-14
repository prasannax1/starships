use <../lib/util.scad>;
use <saucer.scad>;
use <escort.scad>;
use <hangar.scad>;
use <scout.scad>;
use <transwarp.scad>;


module mvm_total_assembly_separate() {
    mvm_main_disk_assembly();
    translate([250,0,100]) mvm_command();
    translate([-100,0,-100]) mvm_transwarp();
    translate([-750/2-250,0,50]) mvm_back_hangar();
    translate([0,0,-175]) mvm_escort();
}

mvm_total_assembly_separate();

module m_main_sep() {
    mvm_total_assembly_separate();
}