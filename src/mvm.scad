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
    scale([1,1,.5]) {
        rotate([0,90,0])
            cylinder(100, 25,25, center=true);
        
        util_mirrored([1,0,0])
            translate([50,0,0])
                sphere(25);

        difference() {
            rotate([90,0,0])
                cylinder(10,50,50,center=true,$fn=6);
            translate([0,0,-200])
                cube(400, center=true);
        }
    }
}


module mvm_main_disk_assembly() {
    mvm_main_disk();
    
    util_mirrored([0,1,0])
        translate([0,330,-52])
            mvm_main_disk_nacelle();
    
    translate([333,0,-45])
        mvm_main_disk_deflector();
}

module mvm_main_disk_deflector() {
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
    
    translate([-25,0,50*.7*.6*.5])
        cube([50, 50*1.5, 50*.7*.6], center=true);
        
    translate([-50,0,50*.7*.6*.5])
        scale([1,1.5,1])
            cylinder(50*.7*.6, 25,25, center=true);
        
}

mvm_main_disk_assembly();

translate([0,0,35])
util_saucer(360,360,35);


