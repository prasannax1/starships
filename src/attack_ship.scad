module at_main_unscaled() {
union() {
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
}


module at_main_minus() {


    translate([0,40.5,-2.5])
        sphere(1.5, $fn=16);

    translate([-2.5,39,1])
        rotate([60,0,0])
            cube([5,5,10]);


}

module at_main() {
    difference() {
        scale([2,4,1]) 
            at_main_unscaled();
        at_main_minus();
    }
}



module at_saucer() {
    intersection() {
        scale([2,4,1])
            at_main_unscaled();

        translate([0,20,-25])
            rotate([-15,0,0])
                cylinder(40,40,40);
    }
}

module at_nacelles() {
    translate([0,-10,8.5]) difference() {
        scale([2,4,1]) difference() {
            sphere(10);
            translate([-12.5,-12.5, 0])
                cube(25);
        }

        translate([0,0,0])
            rotate([0,45,0])
                cube([20,80,20],center=true);

        translate([0,0,0])
            rotate([0,0,0])
                cube([20,80,20],center=true);

        translate([-20,20,-15])
            rotate([45,0,0])
                cube(40);

        translate([-20,-40,-42])
            rotate([60,0,0])
                cube(40);
    }
}


module at_main_2() {
    union() difference() {
        union() {
            at_saucer();
            at_nacelles();
        }
        at_main_minus();
    }
}

module attack() {
    scale(.75) at_main_2();
}

attack();
