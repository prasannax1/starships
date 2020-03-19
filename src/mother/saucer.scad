use <../lib/util.scad>;

module mvm_saucer_plus() {
    difference() {
        union() {
            scale([.975,.975,.975])
            util_saucer(750,750,85);
            
            difference() {
                util_saucer(750,750,85);

                translate([0,0,15])
                difference() {
                    cylinder(20,400,400,center=true);

                    scale([1,1,1.5])
                    util_star(410,25,16,half=true);
                }
                

            }

//            intersection() {
//                cylinder(200,750/2,750/2,center=true);
//                translate([-750/2,0,0])
//                util_saucer(500,500,50);
//                
//               
//            }

            intersection() {
                util_nacelle(500,575,95,curved=true);
                cylinder(400,750/2,750/2,center=true);
            }
        }
        
        translate([0,0,500+80])
        cube(1000,center=true);
    }
    
    intersection() {
        cylinder(400,750/2,750/2,center=true);
        translate([-100,0,0])
        util_nacelle(350,100,100,curved=true);
    }
    
    util_mirrored([0,1,0])
    translate([-320,144,36])
    rotate([-25,0,0])
    util_nacelle(180,80,15,curved=true);
    
    cylinder(7,120,120,center=true);
    
    translate([0,0,80+5-.01])
    difference() {
        cylinder(10.02,84,72,center=true);
        
        translate([-150/2+.01,0,0])
        scale([.66,2,1])
        cylinder(15,60,75,center=true,$fn=3);
        
        translate([-65,0,16.5])
        rotate([90,0,0])
        cylinder(200,25,25,center=true, $fn=6);
    }
}

module mvm_saucer_minus() {

    
    translate([-750/2,0,0])
    util_mirrored([0,0,1]) {
        util_saucer(500,180,50);
        util_saucer(500,360,15);
    }
}

module mvm_saucer() {
    difference() {
        mvm_saucer_plus();
        mvm_saucer_minus();
    }
}

mvm_saucer();