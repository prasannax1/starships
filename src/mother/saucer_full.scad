include <common.scad>;
use <saucer.scad>;
use <warp.scad>;

module saucer_full() {
    saucer(scout_attached=true);

    translate([-warp_length/2-saucer_width/2+scout_width/4,0,.01]) warp_sec_hull();
    
    translate([0,0,-labs_height-command_height+.01]) warp_saucer();
}

saucer_full();