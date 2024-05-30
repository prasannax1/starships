use <../lib/util.scad>
include <common.scad>
use <disks.scad>


module spherical_hangar_door(d1, h1) {
    rotate_extrude(angle=360, convexity=10, $fn=faces_rough)
    difference() {
        scale([1, 2*h1/d1, 1])
        circle(d=d1, $fn=faces_concave);

        translate([-(d1+h1)/2,0,0])
        square(d1+h1, center=true);

        translate([0, -(d1+h1)/2-.05,0])
        square(d1+h1, center=true);
    }
}



