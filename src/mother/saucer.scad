use <../lib/util.scad>;


module mvm_main_disk() {
    difference() {
        translate([0,0,-30]) difference() {
            util_saucer(750,750,115);
            translate([0,0,500+100])
                cube(1000, center=true);
        }
        translate([0,0,-15]) difference() {
            cylinder(20,800/2, 800/2, center=true);

            scale([1,1,5])
                util_star(800/2, 20, 16, half=true);
        }
    }
    
    translate([0,0,-14])
       cylinder(24, 740/2, 700/2, center=true);

}

module mvm_main_disk_nacelle() {
    scale([1,1,.3]) {
        rotate([0,90,0])
            cylinder(150, 25,25, center=true);
        
        util_mirrored([1,0,0])
            translate([75,0,0])
                sphere(25);

        difference() {
            rotate([90,0,0])
                cylinder(10,75,75,center=true,$fn=6);
            translate([0,0,-200])
                cube(400, center=true);
        }
    }
}

module mvm_main_disk_impulse() {
    difference() {
        intersection() {
            translate([-750/4,0,-30])
            scale([1,1,80/120])
            rotate([0,90,0])
            cylinder(750/2,120,185,center=true);

            
            translate([0,0,-30])
            //util_saucer(750,750,750/2);
            cylinder(1000,750/2,750/2,center=true);
            
            
        }
        
        translate([0,0,500+100-30])
        cube(1000, center=true);
        
        translate([0,0,-530])
        cube(1000, center=true);
        
        translate([-750/2+7,0,25])
        cube([16,100,20-.1], center=true);
    }
}



module mvm_main_disk_deflector() {
    difference() {
        union() {
            scale([1,1.5,.5])
                difference() {
                    union() {
                        rotate([0,90,0])
                            cylinder(100,25,25,center=true);
                        translate([-50,0,0])
                            sphere(25);
                    }
                    translate([50,0,0])
                        sphere(20);
                }
            
            translate([0,0,50*.7*.6*.5])
                cube([100, 50*1.5, 50*.7*.6], center=true);
                
            translate([-50,0,50*.7*.6*.5])
                scale([1,1.5,1])
                    cylinder(50*.7*.6, 25,25, center=true);
        }
        
        translate([0,0,40])
            cube([1000,1000,70], center=true);
    }
        
}

module mvm_main_disk_assembly() {
    mvm_main_disk();
    
    util_mirrored([0,1,0])
        translate([0,330,-40])
            mvm_main_disk_nacelle();
    
    translate([315,0,-30])
        mvm_main_disk_deflector();
    
    mvm_main_disk_impulse();
    
    translate([-120,0,0])
    util_nacelle(240,120,90,curved=true);
}


mvm_main_disk_assembly();

module mvm_saucer() {
    mvm_main_disk_assembly();
}
