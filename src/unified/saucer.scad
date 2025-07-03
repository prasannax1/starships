use <disk4.scad>
use <disk1.scad>
use <engines.scad>
include <common.scad>

module saucer() {
    disk_4();
    translate([-disk_4_width/2+disk_1_width/2,0,disk_4_height-10.05])
    disk_1();
}

saucer();
