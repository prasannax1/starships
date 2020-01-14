use <lib/util.scad>;

module b_saucer() {
    difference() {
        util_mirrored([0,0,1])
            util_saucer(1000,1000,64);

        sphere(240);
        
    }

    sphere(90);

    hull() {
        util_mirrored([0,0,1])
            util_saucer(300,300,50);

        translate([-250,0,0])
            rotate([0,90,0])
                cylinder(150,2,2,center=true);
    }
}

//scale([1,1.5,.75]) {
//translate([-500,0,0])
//sphere(90);
//
//translate([-550,0,0])
//rotate([0,90,0])
//cylinder(100,90,90, center=true);
//
//translate([-600,0,0])
//sphere(90);
//}

module b_body() {
    translate([-550,0,0])
        util_mirrored([0,0,1])
            util_saucer(270,270,66);
}


module b_nacelle() {
    util_mirrored([0,0,1])
        util_mirrored([0,1,0])
            translate([-550,0,0])
                scale([3,1,1])
    rotate([75,0,0]) {
        rotate([0,-15,0])
            cylinder(400,25,15);

        translate([0,0,375]) {
            difference() {
                util_mirrored([0,0,1])
                    util_saucer(500,64,32);

                translate([600,0,0])
                    cube(1200,center=true);
            }

            util_mirrored([0,0,1])
            util_saucer(100,64,32);
        }

    }
}

module b_main() {
    b_saucer();
    b_body();
    b_nacelle();
}

module behemoth() {
    scale(1) b_main();
}

behemoth();