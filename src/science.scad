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
            scale([2,4,1]) 
                at_main_unscaled();
            at_main_minus();
        }
        at_nacelle_assembly();
    }
}

scale([3.2,3,1])
at_main_unscaled();

module sc_nacelle() {
scale([1,1,.5]) {
translate([0,20,-10])
rotate([90,0,0])
cylinder(40,5,5);

translate([0,20,-10])
sphere(5);

translate([0,-20,-10])
sphere(5);
}
}

translate([25,0,0]) sc_nacelle();

translate([-25,0,0]) sc_nacelle();

difference() {
translate([0,0,-78])
rotate([90,0,0])
translate([0,0,-10])
cylinder(20,80,80);

translate([0,0,-78])
rotate([90,0,0])
translate([0,0,-12])
cylinder(24,78,78);

translate([0,0,-84])
cube(160, center=true);
}


intersection() {
union() {
translate([0,0,7.5])
scale([1,1,.25]) {
rotate([90,0,0])
cylinder(30,16,16);

sphere(16);
}

translate([-16,-32,0])
cube([32,32,7]);
}

scale([3.2,3,1])
translate([0,0,-15])
cylinder(40,10,10);
}


