use <../lib/util.scad>;

module heavy_body() {
    hull() {
        translate([25,0,0])
        util_ovoid(10,5,8, 3, .5);

        util_mirrored([0,1,0])
        translate([20,2,3.5])
        util_ovoid(6,6,2,3,1);

        util_ovoid(25,10,15,6.5,.5);

        translate([-10,0,0])
        util_ovoid(1,1,12,6,.5);
    }
}

module heavy_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,1])
    util_ovoid(10,15,4,1.1,1.1);
}

module heavy_runabout() {
    heavy_body();
    util_mirrored([0,1,0]) heavy_assembly();
}

module heavy_assembly() {
    translate([0,10,3]) heavy_nacelle();

    hull() {
        translate([0,10,3])
        sphere(d=2, $fn=10);

        translate([0,0,1.2])
        sphere(d=2, $fn=10);
    }
}

heavy_runabout();