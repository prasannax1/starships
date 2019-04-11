module half_sphere() {
	difference() {
		sphere(10);
		translate([0,-10,-10])
			cube(20);
	}
}

module egg() {
	scale([2,1,1]) half_sphere();
	rotate([0,0,180]) half_sphere();
}

module exp_saucer() {
	scale([3,3,.8]) difference() {
		egg();
		translate([-20,-10,-35])
			cube(30);
	}
	translate([0,0,5])
		sphere(5);
}


module exp_body() {
	scale([2.5,1.8,.8])	difference() {
		translate([15,0,-10])
			rotate([0,0,180])
				egg();

		translate([0,0,-10])
			sphere(10);
	}
}



module exp_pylons() {
	translate([0,0,25]) difference() {
		rotate([0,90,0])
			cylinder(10,25,25);
        translate([-5,0,0])
            rotate([0,90,0])
                cylinder(20,24,24);

		translate([-10,-25,-15])
			cube([50,50,50]);
	}
}

module exp_nacelle() {
	rotate([0,0,180])
		scale([2.5,0.4,0.15])
			egg();
}

module exp_nacelle_assembly() {
	scale([1,1.5,2]) {
		exp_pylons();
		translate([10,18,10])
			exp_nacelle();
		translate([10,-18,10])
			exp_nacelle();
	}
}

module exp_main() {
	exp_saucer_2();
	exp_body();
	translate([75,0,-8])
		exp_nacelle_assembly();
}

module explorer() {
	scale(1) exp_main();
}

explorer();

module exp_saucer_2() {
    scale([6,3,1]) union () {
        rotate([0,90,0])
            half_sphere();

        difference() {
            translate([0,0,17.34])
                sphere(20);
            translate([-20,-20,0])
                cube([40,40,40]);
        }
    }
    
    translate([15,0,0])
        scale([1.5,1.5,1])
            translate([0,0,5])
                sphere(7.5);
}
