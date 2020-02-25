use <../lib/util.scad>;


module mvm_transwarp() {
    difference() {
        union() {
            mirror([0,0,1])
            translate([-(640-450)/2,0,0])
            util_saucer(480,300,40);
            
            translate([-200,0,0])
            scale([1,1,40/120])
            difference() {
            rotate([0,90,0])
            cylinder(200+270, 120,120, center=true);
                
                translate([0,0,500])
                cube(1000, center=true);
            }

        }
        
        translate([0,0,-500-20])
        cube(1000,center=true);
    }


    difference() {
        translate([-750/2,0,0])
            mirror([0,0,1])
 //               util_saucer(750,270,120);
        union() {
    
            difference() {
                util_saucer(640,240,125);
                translate([250+.01,0,0])
                cube(500,center=true);
            }
            difference() {
                util_saucer(540,240,125);
                translate([-250-.01,0,0])
                cube(500, center=true);
            }
        }

        translate([-120,0,-64])
            rotate([0,90,0])
                cylinder(175,15,80,center=true);
        
        translate([-600,0,-175])
            scale([1.8,1,1])
                rotate([90,0,0])
                    cylinder(500,150,150,center=true);

        translate([-600+-250,0,-250-25])
            cube(500,center=true);
    }
    
    scale([1,1,1])
        mvm_transwarp_nacelle_bar();
    
    util_mirrored([0,1,0])
        translate([-705,750/2-60,100]) 
            mvm_transwarp_nacelle();
}



module mvm_transwarp_nacelle_bar() {
    difference() {
        translate([-700,0,-30])
        util_nacelle_bar(700,125,700,16);
        
        translate([-600,0,-175])
            scale([1.8,1,1])
                rotate([90,0,0])
                    cylinder(500,150,150,center=true);

        translate([-600+-250,0,-250-25])
            cube(500,center=true);

        translate([-750/2,0,0])
            util_saucer(750,270,150);

        translate([-1450,0,0])
            cylinder(900,750,750,center=true);
        
//        translate([-1124,0,0])
//        cube(750,center=true);

        util_mirrored([0,1,0])
            translate([-750/2+175,550,0])
                cylinder(900,500,500,center=true);
        
        translate([-750/2,0,490])
            rotate([90,0,0])
                cylinder(900,400,400,center=true);
    }
}

module mvm_transwarp_nacelle() {
    translate([125,0,0]) {
        difference() {
            union() {
                util_saucer(1100,120,60);
                mirror([0,0,1])
                    util_saucer(1100,120,20);
            }
            
            translate([600,0,0])
                cube(1200,center=true);
        }

        util_saucer(500,120,60);
        mirror([0,0,1])
            util_saucer(500,120,20);
    }
}

mvm_transwarp();
