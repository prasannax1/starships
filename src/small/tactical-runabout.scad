use <../lib/util.scad>;

module tac_body() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,1.5,0])
        util_ovoid(15,5,2,3,.5,faces=9);

        util_mirrored([1,0,0])
        translate([2,0,1])
        util_ovoid(1,1,12,1,1,faces=6);
    }
}

module tac_nacelle() {
    util_ovoid(6,12,1.8,.2, 2.5, faces=7);
}

module tactical() {
    tac_body();

    util_mirrored([0,1,0])
    translate([0,4.5,1])
    rotate([70,0,0])
    tac_nacelle();

    util_mirrored([0,1,0])
    translate([0,2,2.8])
    scale([4,1,1])
    rotate([0,90,0])
    sphere(d=2, $fn=8);
}

tactical();