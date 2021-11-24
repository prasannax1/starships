use <../lib/util.scad>;

module attack_primary_placeholder() {
    intersection() {
        translate([-5+.01,0,0])
        rotate([0,-45,0])
        translate([50,0,0])
        cube(100, center=true);


    }
}

module attack_secondary_body() {
    difference() {
        hull() {
//            translate([-15,0,2])
//            util_ovoid(3,3,12,1,1);

            translate([-12-6,0,4.5])
            scale([30,8.5,6])
            rotate([0,90,0])
            sphere(d=1, $fn=8);
            
            translate([-12-6,0,0])
            scale([30,8.5,6])
            rotate([0,90,0])
            sphere(d=1, $fn=8);
        }
            

        attack_primary_placeholder();
    }
}

module attack_secondary() {
    attack_secondary_body();
    attack_secondary_assembly();
}


module attack_secondary_assembly() {
    util_mirrored([0,1,0]) {
        hull() {
            translate([-13,0,2])
            sphere(d=4, $fn=8);

            translate([-26,0,2])
            sphere(d=4, $fn=8);


            translate([-40,12.5-4,-3])
            scale([2,1,1])
            sphere(d=1.5, $fn=8);
        }

        translate([-36,12.5-4,-2])
        util_ovoid(15,30,6,3,3,faces=7);
    }
}

attack_secondary();