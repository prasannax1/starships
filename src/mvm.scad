use <util.scad>;


module mvm_main_disk() {
    difference() {
        union() {
            translate([0,0,15])
                cylinder(45,750/2, 380/2, center=true);
            translate([0,0,-25])
                cylinder(35, 720/2, 750/2, center=true);
        }
        translate([0,0,-25]) difference() {
            cylinder(25,750/2, 750/2, center=true);

            scale([1,1,5])
                util_star(800/2, 10, 16, half=true);
        }
    }
    
    translate([0,0,-25])
        cylinder(34, 710/2, 710/2, center=true);
    
    translate([0,0,-40])
        cylinder(20,250,250,center=true);
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
        translate([0,330,-57.5])
            mvm_main_disk_nacelle();
    
    translate([333,0,-57.5])
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
        
    translate([-680,0,30])
        mvm_main_disk_impulse();
}

mvm_main_disk_assembly();

module mvm_main_disk_impulse() {
    difference() {
        scale([2,.8,.3]) rotate([0,-90,0]) rotate(360/16) {
            difference() {
                cylinder(100,100,100,center=true, $fn=8);
                cylinder(120,80,80,center=true, $fn=8);
            }    
            translate([0,0,-10])
                cylinder(80,100,100,center=true, $fn=8);
        }

        translate([-250,0,-30])
            rotate([0,45,0])
                cube(300,center=true);
    }
}
