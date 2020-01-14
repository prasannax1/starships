use <../lib/util.scad>;
use <saucer.scad>;
use <hangar.scad>;

module mvm_total_assembly_starbase() {
    mvm_main_disk_assembly();
    translate([-750/2,0,-30+.01])
        mvm_back_hangar();
}

mvm_total_assembly_starbase();
