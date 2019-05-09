module at_main_unscaled() {
    difference() {
        sphere(10);
        translate([-20,-20,-20])
            cube([40,40,20]);
    }

    difference() {
        intersection() {
            translate([0,20,0])
                rotate([90,0,0])
                    cylinder(40,5,5);
            translate([0,0,-20])
                cylinder(40,10,10);
        }
        translate([-20,-20,0.01])
            cube([40,40,20]);
    }
}


module at_main_minus() {
    translate([-10,-90,-10])
        rotate([-15,0,0])
            cube([20,80,80]);

    translate([0,40.5,-2.5])
        sphere(1.5, $fn=16);

    translate([-2.5,39,1])
        rotate([60,0,0])
            cube([5,5,10]);

    translate([0,-35,0])
        rotate([45,0,0])
            cube([40,10,40], center=true);
}

module at_main() {
    difference() {
        scale([2,4,1]) 
            at_main_unscaled();
        at_main_minus();
    }
}

module attack() {
    scale(.75) at_main();
}

attack();
