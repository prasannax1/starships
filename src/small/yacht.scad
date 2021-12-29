use <../lib/util.scad>;


module y_saucer() {
    difference() {
        scale([1,1,1])
        translate([0,0,-3])
        util_saucer_shape(36, 6, 1, 0, 1);

        cube([100,100,.5], center=true);
        
        translate([-18,0,-3]) intersection() {
            rotate([0,90,0])
            cylinder(h=.5, d=11, $fn=64, center=true);

            translate([0,0,250+.5])
            cube(500, center=true);
        }
    }

    cylinder(center=true, h=1, d=31);
}

module yacht() {
    y_saucer();
    y_body();
    y_assembly();
}

module y_body() {
    difference() {
        intersection() {
            translate([0,0,-3])
            rotate([0,90,0])
            cylinder(d=12, h=36, center=true, $fn=64);

            union() {
                cylinder(d=36, h=50, center=true, $fn=64);
                translate([-250,0,0])
                cube(500, center=true);
            }
        }

        translate([250,0,250-3+.01])
        cube(500, center=true);
        
        translate([18, 0,-9])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(r=6, h=30, $fn=64, center=true);

        translate([-18, 0,-9])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(r=6, h=30, $fn=64, center=true);
        
        translate([24,0,-3])
        rotate([0,90,0])
        cylinder(d=11, h=36, center=true, $fn=64);
        
        translate([-18,0,-3]) intersection() {
            rotate([0,90,0])
            cylinder(h=.5, d=11, $fn=64, center=true);

            translate([0,0,250+.5])
            cube(500, center=true);
        }
    }

    translate([6,0,-3])
    sphere(d=10, $fn=64);
}

module y_nacelle() {
    hull()
    util_mirrored([1,0,0])
    translate([15,0,0]) {
        cylinder(h=2, d=4, $fn=64, center=true);

        translate([0,0,1])
        sphere(d=4, $fn=64);

        translate([0,0,-1-1+.01])
        cylinder(h=2, d1=2, d2=4, center=true, $fn=64);
    }
}

module y_assembly() {
    util_mirrored([0,1,0])
    translate([-2,12,-8]) y_nacelle();

    util_mirrored([0,1,0])
    translate([0,0,-3])
    rotate([66,0,0]) {
        util_mirrored([1,0,0])
        translate([3,0,-6])
        cylinder(h=12, d=2, center=true, $fn=64);

        translate([0,0,-6])
        cube([6,2,12], center=true);
    }
}
yacht();