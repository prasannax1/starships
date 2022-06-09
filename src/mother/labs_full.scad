include <common.scad>;
use <labs.scad>;
use <warp.scad>;

labs(show_hole=true);

translate([0,0,labs_height-.02])
disk_1(bottom_open=true);

translate([-labs_width/2-35,0,0.01])
warp_secondary();