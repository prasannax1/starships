use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>

module frigate() {
    translate([disk_1_width/2+5,0,-.01])
    disk_1();

    class_2_sec_body();

    util_mirrored([0,1,0])
    rotate([70,0,0]) {
        hull() {
            sphere(d=3);
            translate([-10,0,0]) sphere(d=3);
            translate([-30,0,55]) sphere(d=2);
            translate([-80,0,55]) sphere(d=2);
        }

        translate([-30,0,55]) 
        rotate([-0,0,0]) class_1_nacelle();
    }
}

frigate();