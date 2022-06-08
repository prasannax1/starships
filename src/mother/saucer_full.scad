use <saucer.scad>;
use <warp.scad>;
include <common.scad>;

saucer();

translate([-saucer_upper/2-100,0,0.01])
warp_secondary();