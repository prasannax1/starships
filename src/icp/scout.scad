use <../lib/util.scad>;

module scout() {
    difference() {
        util_mirrored([0,0,1]) 
            util_saucer(64,54,6);

        translate([0,0,-43]) 
            cube(80, center=true);

        translate([36,0,0])
            rotate([0,15,0])
                cube(15,center=true);
        
        translate([35,0,1.5])
            rotate([0,15,0])
                cube([25,5,2],center=true);
    }
    

    
    translate([0,0,-2.95])
        mirror([0,0,1]) {
            util_nacelle(48,45,11,curved=true,up=false);
            
        }
    
    difference() {
        translate([-32,0,-2])
            util_nacelle_bar(50,6,40,1);
    
        translate([-82,0,0])
            cylinder(20,40,40,center=true);
    
        util_mirrored([0,1,0])
            translate([-15,40,0])
                cylinder(20,30,30, center=true);
    }
    
    util_mirrored([0,1,0])
        translate([-30,22,3])
            rotate([-60,0,0])
                util_nacelle(48,6,8,curved=true);
}

scout();