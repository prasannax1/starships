use <../lib/util.scad>;


module mvm_command() {
    difference() {
        util_saucer(150,150,20.5);
        translate([75,0,10])
            cube(25,center=true);
        
        translate([0,0,250+20])
        cube(500,center=true);
    }

    util_saucer(50,50,25);
    
    util_nacelle(96,45,28,curved=true);


    
    difference() {
        util_mirrored([0,1,0]) {
            translate([-100,0,0])
            rotate([-90,0,0])
            mirror([1,0,0])
            util_nacelle(64,15,82,curved=true);
        
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

