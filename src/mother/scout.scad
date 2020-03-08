use <../lib/util.scad>;


module mvm_command() {
    difference() {
        util_saucer(150,150,20.5);
        translate([75,0,10])
            cube(25,center=true);
        
        translate([0,0,250+20])
        cube(500,center=true);
    }

    util_saucer(64,64,25);
    
    util_nacelle(96,64,28,curved=true);


    
    difference() {
        util_mirrored([0,1,0]) {
            difference() {
                translate([-100,0,0])
                rotate([-90,0,0])
                mirror([1,0,0])
                util_nacelle(64,32,82,curved=true);
                
                translate([-175,0,0])
                cube(150,center=true);
                
                translate([0,0,200+12])
                cube(400,center=true);
            }
            
                            
        
            translate([-75,59,0])
            rotate([-90,0,0])
            util_nacelle(96,24,24,curved=true);
        }
        
        translate([0,0,-250])
        cube(500, center=true);
    }
    

}

mvm_command();

module mvm_scout() {
    mvm_command();
}

