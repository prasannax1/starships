use <../lib/util.scad>;

module yacht_saucer() {
    translate([0,0,-1.25]) {
    difference() {
        util_ovoid(15,15,30,4.2,.5);
        
        translate([0,0,27/2 + 2.5])
        cube(27,center=true);
    }

    translate([0,0,2.5])
    util_ovoid(11.5,11.5,23,.5,1);

    util_ovoid(5,5,10,4,1.25);
    }
}

module yacht_neck() {
    difference() {
        hull() {
            translate([-12.5,0,0])
            util_ovoid(6,1,3.6,1,3);

            translate([-12.5,0,-5])
            util_ovoid(2.5,4,4,8,5);
            
        }

        translate([-12.5,0,27/2 + 1.25])
        cube(27,center=true);
    }

    translate([-12.5,0,1.25])
    util_ovoid(.9,.9,1.8,.3,1);
}

module yacht_body() {
    difference() {
        translate([-13.5,0,-8]) {
            util_ovoid(7.5,23.5,8,4,4);
            util_ovoid(7,15,10,1,1);
            util_ovoid(6.4,5,2,7,1);
        }

        translate([0,0,-8]) sphere(8,$fn=67);
        
        translate([-13.5-17-13.5,0,-8])
        rotate([0,10,0])
        cube(27,center=true);
        
        translate([-33.5,0,-12.5])
        scale([3,1,1])
        rotate([90,0,0])
        cylinder(h=27,r=4,center=true,$fn=32);
    }



    translate([-29.4,0,-8])
    util_ovoid(2.7,2.7,5.4,2.7,.5);

    translate([-29.4,0,-8.27])
    cylinder(h=.5,d=5.8,center=true, $fn=32);
}

module yacht_nacelles() {
    util_mirrored([0,1,0]) {
        difference() {
            translate([-27,11,2.5])
            util_ovoid(5,27,5,2.5,2.5);
                
            translate([-22,11,2.5])
            sphere(2.5, $fn=32);
            
            translate([-52,11,0])
            scale([1,1,.75])
            rotate([90,0,0])
            cylinder(r=5,h=5,center=true);
        }

        translate([-27,11,2.5])
        util_ovoid(4.4,22.5,4.5,2.25,2.25);
    }
}

module yacht_pylons() {
    util_mirrored([0,1,0]) {
        hull() {
            translate([-30,11,2.5])
            sphere(.3, $fn=16);

            translate([-32.3,11,2.5])
            sphere(.3, $fn=16);

            translate([-20,0,-8])
            sphere(.8, $fn=16);

            translate([-27,0,-8])
            sphere(.8, $fn=16);
        }
    }
}

module long_yacht() {
    union() {
        yacht_saucer();
        yacht_neck();
        yacht_body();
        yacht_pylons();
        yacht_nacelles();
    }
}

long_yacht();






