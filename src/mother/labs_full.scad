include <common.scad>;
use <labs.scad>;
use <warp.scad>;

module labs_full() {
    labs(show_hole=true);

    translate([0,0,labs_height/2-.02])
    disk_1();

    translate([-labs_width/2-2.5*labs_height,0,-labs_height/2+0.01])
    warp_secondary();
}

labs_full();