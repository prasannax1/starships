use <scout_full.scad>;
use <command_full.scad>;
use <labs_full.scad>;


translate([0,0,100]) command_full();
translate([0,0,200]) scout_full();
translate([0,0,-30]) labs_full();