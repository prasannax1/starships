use <../lib/util.scad>;

module science_body() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,2,0])
        util_ovoid(27,30,23,5,.5, faces=20);


        util_mirrored([0,1,0])
        translate([0,2,0])
        util_ovoid(15,7,3,12,.5, faces=5);
        
        util_mirrored([0,1,0])
        translate([-8,2,0])
        util_ovoid(15,7,3,12,.5, faces=5);
    }


    hull() {
        util_mirrored([0,1,0])
        translate([0,2,0])
        util_ovoid(30,30,23,9,.5);
    }

    hull() {
        util_mirrored([0,1,0])
        translate([0,2,0])
        util_ovoid(15,7,7,9,.5, faces=8);

        translate([-50,0,0])
        difference() {
            sphere(d=15,$fn=8);

            translate([-50,0,0])
            cube(100, center=true);

            translate([0,0,-50])
            cube(100, center=true);
        }
    }
}

module science_nacelle() {
    hull()
    util_mirrored([0,1,0])
    translate([0,2,0])
    util_ovoid(23,15,4,2,2);
}

module science() {
    science_body();
    science_assembly();
}

module science_assembly() {
    util_mirrored([0,1,0]) {
        translate([-40,14,10]) science_nacelle();

        hull() {
            translate([-40,14,10]) 
            sphere(d=2);

            translate([-45,14,10]) 
            sphere(d=2);

            translate([-25,0,2]) 
            sphere(d=3);

            translate([-35,0,2]) 
            sphere(d=3);
        }
    }
}

science();