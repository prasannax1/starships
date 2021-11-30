use <../lib/util.scad>;

//include <attack-primary.scad>;

module attack_secondary_body_plus() {
    difference() {
        intersection() {
            translate([-25-20,0,-3])
            rotate([0,90,0])
            cylinder(d=12, h=50, center=true,$fn=64);

            translate([0,0,0])
            translate([0,0,-500])
            cube(1000,center=true);
        }

        translate([-20-50,0,-2.5-.5]) 
        intersection() {
            cube([.5, 18, 5], center=true);

            rotate([0,90,0])
            cylinder(h=.5, d=10, center=true, $fn=64);
        }
        
        translate([-70,0,-9])
        scale([8,1,1])
        rotate([90,0,0])
        cylinder(r=3, h=18, center=true, $fn=64);
    }



    intersection() {
        translate([-20,0,-1.5])
        scale([8,1,1.25])
        rotate([90,0,0]) {
            cylinder(d=12, h=9.5, center=true,$fn=64);
        
            util_mirrored([0,0,1])
            translate([0,0,1.25/2+9.5/2-.01])
            cylinder(d1=12, d2=10, h=1.25+.02, center=true, $fn=64);
        }


        translate([-20,0,-3])
        translate([-500,0,500])
        cube(1000,center=true);
    }

    translate([-20,0,4.5]) {
        translate([0,0,-.5])
        cylinder(d=12, h=1.5, $fn=64, center=true);
        
        translate([0,0,1-.01])
        cylinder(d1=12, d2=9.5, h=1.5, $fn=64, center=true);
    }

}

module attack_secondary_body(attached=true) {
    difference() {
        attack_secondary_body_plus();
        
        if (attached==false) {
            translate([-20,0,0])
            hull()
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0,4.5,1.5])
            rotate([0,90,0])
            cylinder($fn=8, d=2, h=.5, center=true);
        }    
        
        translate([-20, 0, 6])
        cylinder(d=9, h=.5, center=true, $fn=64);
        
        translate([-20,0,-9])
        scale([1.5,1,1])
        rotate([90,0,0])
        cylinder(r=6, h=18, center=true, $fn=64);
        
        intersection() {
            translate([0,0,-3])
            rotate([0,90,0])
            cylinder(d=10,h=60,center=true, $fn=64);

            translate([0,0,-50-3+.01])
            cube(100, center=true);
        }
    }
    
    translate([-30,0,-3])
    scale([.75,1,1])
    sphere(d=8, $fn=64);
}

module attack_secondary(attached=true) {
    attack_secondary_body(attached);

    util_mirrored([0,1,0])
    translate([0,0,-2.5])
    rotate([70,0,0]) {
        translate([-50,0,-12])
        attack_secondary_nacelle();

        translate([-60,0,-8]) {
            cube([13, 3, 16], center=true);
            
            util_mirrored([1,0,0])
            translate([6.5,0,0])
            cylinder(d=3, h=16, $fn=64, center=true);
            
        }
    }
}

module attack_secondary_nacelle() {
    scale([7.5,1,1]) {
        intersection() {
            rotate([90,0,0]) {
                cylinder(h=4, r=8, center=true, $fn=64);

                util_mirrored([0,0,1])
                translate([0,0,3-.01])
                cylinder(h=2, r1=8, r2=4, center=true, $fn=64);
            }

            translate([-25+.01, 0, -25+.01])
            cube(50, center=true);
        }


        rotate([0,-90,0]) {
            translate([0,0,2])
            cylinder(h=4, d=8, center=true, $fn=64);

            translate([0,0,6-.01])
            cylinder(h=4, d1=8, d2=4, center=true, $fn=64);
        }
    }

    sphere(d=8, $fn=64);

    translate([0,0,-2])
    cylinder(h=4, d=8, center=true, $fn=64);

    translate([0,0,-6+.01])
    cylinder(h=4, d1=4, d2=8, center=true, $fn=64);
}

attack_secondary(attached=false);