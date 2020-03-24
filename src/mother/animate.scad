use <main.scad>;


translate([4000*$t*$t*$t,2000*$t*$t*$t*$t, 500*$t*$t*$t])
rotate(25*$t*$t*$t*$t)
rotate([0,-20*$t*$t*$t*$t,0])
translate([-1000,0,0])
import("../../stl/mother/main.stl", 3);


