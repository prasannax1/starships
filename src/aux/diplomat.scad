use <../lib/util.scad>;

module dip_saucer() {
    difference() {
        util_saucer_shape(36, 4,.5,.5,.5);

        translate([0,0,2+3])
        cylinder(d=16, center=true, h=4);
    }

    translate([0,0,3])
    util_saucer_shape(16, 3, .25, 2, 2);
}

module dip_body() {
    difference() {
        union() {
            hull() {
                translate([-18,0,0])
                util_ovoid(36, 9, 12, 4, 1);

                translate([0,0,3])
                cylinder(d=6, h=5.9, center=true, $fn=16);
            }
            
            hull() {
                translate([-18,0,0])
                util_ovoid(36, 16, 12, 4, 1);

                translate([0,0,3])
                cylinder(d=6, h=5.3, center=true, $fn=16);
            }
            
            translate([-18,0,0])
            util_ovoid(32, 18, 12, 4, 6);
        }

        translate([18,0,-5])
        scale([4.5,1,1])
        rotate([90,0,0])
        cylinder(r=5, h=20, center=true, $fn=100);

        translate([25,0,25])
        cube(50, center=true);

        translate([-18-6,0,-6])
        rotate([90,0,0])
        cylinder(r=6, h=20, center=true, $fn=100);

        translate([-10-18-6,0,-10])
        cube(20, center=true);
        
        translate([6,0,0])
        rotate([0,90,0])
        cylinder(d=8, h=20, center=true, $fn=32);
    }
}

module dip_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,1.5,0])
    util_ovoid(9,27,3,2,1);

    hull()
    util_mirrored([0,1,0])
    translate([0,1.5,0])
    util_ovoid(9,4,2.8,2.5,1);

}

module diplomat() {
    dip_saucer();
    dip_body();
    dip_assembly();
}

module dip_assembly() {
    util_mirrored([0,1,0])
    translate([-18-16,18-5, 5])
    dip_nacelle();

    util_mirrored([0,1,0])
    hull() {
        translate([-18-16-10,18-5, 5])
        sphere(d=1);

        translate([-18-16-5,18-5, 5])
        sphere(d=1);

        translate([-18-12,2, .8])
        sphere(d=1.5);

        translate([-17,4, .8])
        sphere(d=1.5);
    }
}

diplomat();