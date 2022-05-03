include <common.scad>;
use <saucer.scad>;
use <warp.scad>;

saucer(scout_attached=false);

translate([-warp_length/2-saucer_width/2+scout_width/4,0,.01]) warp_sec_hull();