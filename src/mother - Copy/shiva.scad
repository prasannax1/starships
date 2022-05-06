use <scout.scad>;
include <common.scad>;

scout_saucer();

mirror([0,0,1]) translate([-scout_width/8,0,-10]) scout_assembly(0);