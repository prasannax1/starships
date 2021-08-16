use <../lib/util.scad>;

module runabout_body() {
    difference() {
        hull()
        util_mirrored([0,1,0])
        translate([0,2.5,0])
        util_ovoid(18,5,7, 4,1);

        translate([0,0,-35])
        cube(70, center=true);

        translate([35/2+2, 0, 1+3])
        scale([1,1,.5])
        rotate([0,90,0])
        rotate(30)
        cylinder(d=4.2,h=35,center=true,$fn=6);
    }
}

module runabout_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,1,0])
    util_ovoid(8,8,1,.5,.5);
}

module runabout() {
    runabout_body();
    runabout_assembly();
}

module runabout_assembly() {
    util_mirrored([0,1,0]) {
        translate([3,5,-1]) runabout_nacelle();

        hull() {
            translate([2,5,-.75])
            sphere(d=1);

            translate([-2,5,-.75])
            sphere(d=1);

            translate([3,0,2.5])
            sphere(d=1);

            translate([-3,0,2.5])
            sphere(d=1);
        }
    }
}

runabout();