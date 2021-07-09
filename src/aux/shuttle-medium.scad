use <../lib/util.scad>;

module medium_shuttle_body() {
    hull()
    util_mirrored([0,1,0]) {
        translate([0,1,0])
        util_ovoid(8, 2, 2, 2, .5);

        translate([-3,1,0])
        util_ovoid(8,1,2,2,.5);
    }
}

module medium_shuttle_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,.5,0])
    util_ovoid(5,1,.6,.5,.5);
}

module medium_shuttle() {
    medium_shuttle_body();
    util_mirrored([0,1,0])
    translate([-2.5,2.5,0]) 
    medium_shuttle_nacelle();
}

medium_shuttle();