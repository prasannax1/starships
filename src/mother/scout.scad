use <../lib/util.scad>;


module mvm_command() {
    difference() {
        util_saucer(150,150,25);
        translate([75,0,10])
            cube(25,center=true);
    }


    


    translate([-0,0,0])
        mirror([0,0,1])
        scale([1,1,.40])
        util_nacelle(150,80,80,curved=true,up=false);
    
    difference() {
        util_mirrored([0,1,0])
        translate([-75,59,0])
        rotate([-90,0,0])
        util_nacelle(100,24,24,curved=true);
        
        translate([0,0,-250])
        cube(500, center=true);
    }
    
    translate([-100,0,5])
    cube([32,120,7.5],center=true);

}

mvm_command();

module mvm_scout() {
    mvm_command();
}

