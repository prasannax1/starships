module dip_neck() {
    scale([3,1.5,1])
        rotate([0,-15,0])
            cylinder(10,2,2, $fn=16);
}

//dip_neck();

module dip_disk() {
    resize([40,40,8]) {
        difference() {
            translate([0,0,-15])
                sphere(20, $fn=32);

            translate([-40,-40,-80])
                cube(80);
        }

        translate([0,0,-5])
            cylinder(5,12,13.25, $fn=32);
    }
}

module dip_main() {
    difference() {
        dip_disk();
        dip_front_view();
    }
    dip_body();
    dip_pylon_assembly();
    mirror([0,1,0]) dip_pylon_assembly();
}

module dip_body() {
    scale([1,1,0.75])
    translate([-10,0,0]) difference() {
        translate([0,0,-8])
            scale([2,.6,.6])
                sphere(10, $fn=32);

        translate([25,0,-8])
            sphere(20, $fn=32);
    }
}

module diplomat() {
    scale(1) dip_main();
}

diplomat();

module dip_nacelle() {
    difference() {
        union() {
            rotate([0,-90,0])
                cylinder(40,2,2, $fn=16);

            sphere(2, $fn=16);
        }

        translate([-45,0,-15])
            rotate([0,45,0])
                cube(40, center=true);
    }
}

module dip_pylon() {
    rotate([45,0,0])
        cylinder(20,1,1, $fn=16);
}

module dip_pylon_assembly() {
    translate([-25,0,-8]) {
        dip_pylon();
        translate([5,-14,14])
            dip_nacelle();
    }
}

module dip_front_view() {
    translate([23,0,0])
        rotate([0,-30,0])
            cube([10,5,10],center=true);
}