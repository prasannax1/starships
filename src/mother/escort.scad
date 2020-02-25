use <../lib/util.scad>;


module mvm_escort() {
    
    difference() {
        mirror([0,0,1]) util_saucer(150,150,25);
            
        translate([-90-50,0,0])
        cube(180,center=true);
    
        translate([75,0,0])
        cube([25,25,60], center=true);
    }

    
    util_mirrored([0,1,0])
    translate([-10,64,0])
    util_nacelle(120,24,32,curved=true, up=false);
}

mvm_escort();
