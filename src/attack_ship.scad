use <util.scad>;
module at_main_body() {
    util_saucer(80,40,10);
    util_body(80,40,5,10);
}

module at_main_minus() {
    translate([-14,-90,-10])
        rotate([-15,0,0])
            cube([28,80,80]);

    translate([0,40.5,-2.5])
        sphere(1.5, $fn=16);

    translate([-2.5,39,1])
        rotate([60,0,0])
            cube([5,5,10]);

    translate([0,-35,0])
        rotate([45,0,0])
            cube([40,10,40], center=true);
}

module at_nacelle_assembly() {
    translate([12,5,4])
        rotate([0,-45,0])
            at_nacelle_2();
    mirror([1,0,0])
        translate([12,5,4])
            rotate([0,-45,0])
                at_nacelle_2();
}

module at_nacelle_2() {
    scale([.75,1.2,2.4]) difference() {
        union() {
            rotate([90,0,0])
            union() {
                cylinder(16,5,4,$fn=6);
                translate([0,0,16])
                    cylinder(10,4,3,$fn=6);
                translate([0,0,26])
                    cylinder(8,3,2,$fn=6);
                translate([0,0,34])
                    cylinder(6,2,1,$fn=6);
            }

            rotate([90,0,0])
                sphere(5,$fn=6);
        }

        translate([-30,-50,0])
            cube(60);

        translate([-30,-24,-65])
            rotate([75,0,0])
                cube(60);
    }
}


module at_main() {
    union() {
        difference() {
            rotate(90) 
                at_main_body();
            at_main_minus();
        }
        at_nacelle_assembly();
    }
}

module attack() {
    scale(.75) at_main();
}

attack();
