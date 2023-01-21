use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>

module science() {
    disk_0();

    util_mirrored([0,1,0])

    translate([-disk_0_width/2, disk_0_width/3, 0+.01])
    class_0_attack_engine();

    translate([-disk_0_width*.6,0,-disk_1_height*.5+.05])
    class_0_habitat();
}

science();