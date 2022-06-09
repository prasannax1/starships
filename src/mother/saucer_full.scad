use <saucer.scad>;
use <warp.scad>;
include <common.scad>;

saucer();

translate([-saucer_upper/2-100,0,0.01])
warp_secondary();

translate([-bridge_width-scout_width/2,0,saucer_height-.02]) disk_1();