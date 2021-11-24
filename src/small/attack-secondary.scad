use <../lib/util.scad>;

module attack_secondary_body(attached=true) {

    difference() {
    translate([-20,0,-9])
    render()
    difference() {
        scale([3.975,1,1.25])
        rotate([90,0,0])
        cylinder(r=12, h=12, center=true,$fn=64);
        
        translate([500+.01,0,0])
        cube(1000, center=true);
        
        translate([0,0,-500])
        cube(1000, center=true);
        
    }


        if (attached==false) {
            translate([-20,0,0])
            hull()
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0,4.5,1.5])
            rotate([0,90,0])
            cylinder($fn=8, d=2, h=.5, center=true);
        }
        
        intersection() {
            translate([-68,0,0])
            hull()
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0,4.5,1.5])
            rotate([0,90,0])
            cylinder($fn=8, d=2, h=50, center=true);


            translate([-74,0,3])
            scale([3.5,1,1])
            rotate([90,0,0])
            cylinder(r=8, h=15, $fn=6, center=true);
        }
    }
           



    difference() {
        hull()
        util_mirrored([0,1,0])
        translate([-20,6,-9]) 
        intersection() {
            util_ovoid(10,48,10,5,5);
            
            translate([-500+7.5,0,0])
            cube(1000, center=true);
        }

        hull()
        util_mirrored([0,1,0])
        translate([-12.5,6,-9]) 
        sphere(d=5, $fn=100);
        
        translate([-68,0,-9-5])
        scale([5,1,1])
        rotate([90,0,0])
        cylinder(r=5, h=20, center=true, $fn=100);
    }



    translate([-20,0,4.5])
    cylinder(h=3, d=12, center=true, $fn=100);
}

module attack_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([10,0,-1.5])
    util_ovoid(20,60,5,2.5,2.5);

    hull()
    util_mirrored([1,0,0])
    util_mirrored([0,0,1])
    translate([22,0,-1.5])
    sphere(d=6, $fn=32);
}


module attack_secondary(attached=true) {
    attack_secondary_body(attached);

    util_mirrored([0,1,0])
    translate([-36.5-20,6, -9])
    attack_assembly(-105);
}



module attack_assembly(theta) {
    rotate([theta,0,0]) {
        translate([0,0,17.5])
        rotate([-180,0,0])
        translate([0,0,-2.5])
        attack_nacelle();


        hull() {
            translate([0,0,17.5])
            sphere(d=2.5);

            translate([10,0,17.5])
            sphere(d=2.5);

            translate([20,0,0])
            sphere(d=2.5);

            translate([40,0,0])
            sphere(d=2.5);
        }
    }
}

attack_secondary(attached=false);