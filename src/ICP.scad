use <util.scad>;

module tactical_shuttle() {
    difference() {
        util_saucer(9,9,2.25);

        translate([3,0,2])
            rotate([0,-66,0])
                cube([1.5,1.5,3],center=true);
    }

    translate([-3.5,0,1])
        scale([1,1,.5])
            rotate([90,0,0])
                cylinder(5,2,2,$fn=6,center=true);

    util_mirrored([0,1,0])
        translate([-4,1.5,1])
            rotate([90,0,0])
                util_nacelle(8,2.25,3,curved=true,up=false);
};


module runabout() {
    difference() {
        util_saucer(18,18,3);

        translate([6,0,3])
            rotate([0,-75,0])
                cube([3,3,5],center=true);
    }

    translate([-7.5,0,0])
        scale([1,1,.4])
            rotate([90,0,0])
                cylinder(10,4,4,$fn=6,center=true);

    translate([-7.5,0,1])
        mirror([0,0,1])
            util_nacelle_bar(16,2.5,3,.5);

    util_mirrored([0,1,0])
        translate([-3,7.5,-2])
            scale([1,1,.5])
                union() {
                    rotate([0,90,0])
                        cylinder(14,1.5,1.5,center=true,$fn=16);

                    util_mirrored([1,0,0])
                        translate([7,0,0])
                            sphere(1.5,$fn=16);
                }
}

module yacht() {
    difference() {
        util_saucer(27,27,3.5);

        translate([10,0,3])
            rotate([0,-75,0])
                cube([3,3,5],center=true);
    }

    translate([-13,0,0]) {

        difference(){
            mirror([0,0,1])
                util_saucer(16,8,2.5);

            translate([-4,0,-2.5])
                scale([1.5,1,1])
                    rotate([90,0,0])
                        cylinder(10,2.5,2.5,center=true,$fn=16);
            
            translate([-9,0,-5])
                cube(10,center=true);
            
            translate([7.5,0,-1.25])
                rotate([0,90,0])
                    cylinder(4,.5,1,$fn=16, center=true);
        }

        util_saucer(16,8,1.5);
    }

    translate([-11,0,0])
        difference() {
            util_nacelle_bar(25,2.5,27,.25);
            
            translate([-29.5,0,0])
                cylinder(40,20,20,center=true);

            util_mirrored([0,1,0])
                translate([11,25,0])
                    cylinder(40,25,25,center=true);
        }

    util_mirrored([0,1,0])
        translate([-14,11,2.5])
            util_nacelle(20,4,2,curved=true);
}


module science_runabout() {
    difference() {
        util_saucer(36,36,4);

        translate([15,0,3])
            rotate([0,-75,0])
                cube([3,3,5],center=true);
    }

    translate([-13,0,0]) difference() {
        scale([1.5,1,1.2])
            rotate([90,0,0])
                cylinder(15,4,4,$fn=6,center=true);
        
        translate([0,0,-10]) cube(20,center=true);
    }
    
    translate([-15,0,1])
        util_nacelle_bar(28,2.5,3,.5);
    
    util_mirrored([0,1,0])
        translate([-8,12,3])
            util_nacelle(24,4,2,curved=true);
}


module attack() {
    difference() {
        util_saucer(45,45,5);

        translate([20,0,3])
            rotate([0,-70,0])
                cube([3,3,5],center=true);
        
    }

    difference() {
        scale([1,1,2])
            util_body(45,45,1.5,5);
    
        translate([22.5,0,-1.2])
            sphere(1,$fn=16);
    }

    util_mirrored([0,1,0])
        translate([-12,12,-2.5])
            rotate([75,0,0])
                util_nacelle(40,5,12,curved=true,up=false);

    difference() {
        translate([-10,0,0])
            mirror([0,0,1])
                util_nacelle_bar(35,3.2,20,2);

        util_mirrored([0,1,0])
            translate([2,18,0])
                cylinder(15,15,15,center=true);
        
        translate([-38,0,0]) cylinder(15,22.5,22,5,center=true);
    }
}

module scout() {
    difference() {
        util_saucer(54,54,5);

        translate([24,0,3])
            rotate([0,-70,0])
                cube([3,3,5],center=true);
    }

    translate([-36,0,0]) 
    scale([1.33,.66,1]) {
        difference() {
            cylinder(8,8,32,center=true,$fn=4);
            translate([-35,0,0])
                cube(60,center=true);
        }

        difference() {
            cylinder(8,54,32,center=true,$fn=4);
            translate([-35,0,0])
                cube([60,200,60],center=true);
            translate([35,0,0])
                cube([60,200,60],center=true);
            translate([0,0,-60])
                cube(120,center=true);
        }
    }

    util_mirrored([0,1,0])
        translate([-27,24,1.5])
            rotate([-110,0,0])
                util_nacelle(48,4,8,curved=true);

    translate([0,0,.1])
    util_nacelle(42,32,6.7,curved=true);
    
    translate([0,0,.1])
    mirror([0,0,1])
        tactical_shuttle();
}

scout();