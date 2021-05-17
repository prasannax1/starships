use <../lib/util.scad>;

module small_shuttle_base() {
    util_ovoid(2.5, .5, 1, 1.75, .25, faces=16);
}

module small_shuttle_body() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,1-.5,0])
        small_shuttle_base();

        util_mirrored([0,1,0])
        translate([-2.5,1-.5,1.6])
        mirror([0,0,1])
        small_shuttle_base();
    }
}

module small_shuttle_nacelle() {
    hull()
    util_mirrored([1,0,0])
    translate([1.5,0,0])
    scale([1,1,.5])
    sphere(d=1,$fn=10);
}

module small_shuttle() {
    small_shuttle_body();
    small_shuttle_assembly();
}

module small_shuttle_assembly() {
    util_mirrored([0,1,0]) {
        translate([-1,1.2,-.4]) 
        small_shuttle_nacelle();

        hull() {
            translate([-1,0,.25])
            scale([2.5,1,.25])
            sphere(.5, $fn=10);

            translate([-1.75,1.2,-.4]) 
            scale([1,.75,.25])
            sphere(.5, $fn=10);
        }
    }
}

small_shuttle();