use <util.scad>;


module mvm_main_disk() {
    difference() {
        translate([0,0,-35]) difference() {
            util_saucer(750,750,100);
            translate([0,0,500+70])
            cube(1000, center=true);
        }
        translate([0,0,-20]) difference() {
            cylinder(20,800/2, 800/2, center=true);

            scale([1,1,5])
                util_star(800/2, 20, 16, half=true);
        }
    }
    
    translate([0,0,-20])
       cylinder(34, 740/2, 685/2, center=true);

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


module mvm_main_disk_assembly() {
    mvm_main_disk();
    
    util_mirrored([0,1,0])
        translate([0,330,-50])
            mvm_main_disk_nacelle();
    
    translate([330,0,-40])
        mvm_main_disk_deflector();
    
    mvm_main_disk_impulse();
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



module mvm_command() {
    difference() {
        util_saucer(400,400,50);
        translate([200,0,10])
            cube(40,center=true);
    }

    intersection() {
        difference() {
            scale([1,2,1])
                rotate([0,-90,0])
                    translate([0,0,750/4])
                        cylinder(750/2,30,30,center=true);
            
            translate([0,0,-400])
                cube(800,center=true);
        }
        cylinder(800,266,266,center=true);
    }
    
    translate([-220,0,0])
        util_nacelle_bar(120,40,30,12.5);

    util_mirrored([0,1,0])
        translate([-175,55,32])
            rotate([-30,0,0])
                util_nacelle(200,50,15,curved=true);
}


module mvm_main_disk_impulse() {
    difference() {
        union() {
            scale([1,2,1])
                translate([0,0,35])
                    rotate([0,-90,0])
                        translate([0,0,750/4])
                            cylinder(750/2,30,30,center=true);

            translate([-750/2+50,0,2.5])
                cube([100,120,65],center=true);
        }
        cylinder(800,266,266,center=true);
        
        scale([1.2,1.6,.8])
            translate([-300,0,35])
                rotate([0,-90,0])
                    translate([0,0,750/4])
                        cylinder(750/2,30,30,center=true);
    }
}

module mvm_total_assembly_combined() {
    mvm_main_disk_assembly();
    translate([0,0,35-.01]) mvm_command();
    translate([0,0,-35+.01]) mvm_transwarp();
}

module mvm_transwarp() {
    translate([0,0,-25/2+.1])
        cylinder(25,170,180,center=true);

    translate([0,0,-25/2-5])
        cylinder(25,120,120, center=true);

    difference() {
        translate([-750/2,0,0])
            mirror([0,0,1])
                util_saucer(750,270,150);

        translate([-75,0,-75])
            rotate([0,90,0])
                cylinder(175,35,80,center=true);
        
        translate([-700,0,-175])
            scale([1.8,1,1])
                rotate([90,0,0])
                    cylinder(500,150,150,center=true);

        translate([-700+-250,0,-250-25])
            cube(500,center=true);
    }
}

mvm_total_assembly_combined();



