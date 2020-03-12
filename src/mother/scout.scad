use <../lib/util.scad>;


module mvm_command() {
    util_saucer(150,150,20);
    util_saucer(64,64,25);
    
    translate([-50,0,.01]) {
        util_saucer(100,50,5);
        
        difference() {
            mirror([0,0,1])
            util_saucer(100,50,20);
            
            translate([42,0,-10])
            sphere(5);
        }
    }
    
    
    difference() {
        translate([0,0,-5.5])
        util_nacelle(90,60,35,curved=true);
        
        translate([0,0,-150/2])
        cube(150,center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-75-35+24,0,0])
    rotate(-75)
    util_nacelle(80,24,7.5,curved=true);
    
    util_mirrored([0,1,0])
    translate([-75-35+24,70,0])
    util_nacelle(120,32,18,curved=true);
}

mvm_command();

module mvm_scout() {
    mvm_command();
}

