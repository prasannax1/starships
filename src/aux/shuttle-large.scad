use <../lib/util.scad>;

module large_shuttle() {
    hull()
    util_mirrored([0,1,0]) {
        translate([0,1,0])
        util_ovoid(12,3, 5,2.5, .5);

        translate([-5, 2.3,0])
        util_ovoid(5,1,2, 2.1, .5);
    }

    util_mirrored([0,1,0])
    hull() {
        translate([0,1,0])
        util_ovoid(6,6,1 ,2.5, .1);

        util_mirrored([1,0,0])
        translate([2,4.25,0])
        sphere(d=1.5, $fn=32);
    }
}

large_shuttle();