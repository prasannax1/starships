use <../lib/util.scad>;


module mvm_command() {
    difference() {
        util_saucer(200,200,25);
        translate([100,0,10])
            cube(40,center=true);
    }


    


    translate([-0,0,0])
        mirror([0,0,1])
        scale([1,1,.33])
        util_nacelle(180,120,120,curved=true,up=false);
    
    util_mirrored([0,1,0])
    difference() {
    translate([-180,0,0])
    rotate([-90,0,0])
    mirror([1,0,0])
        scale([1,1,5])
    util_nacelle(80,36,20,curved=true);
        
        translate([-100,0,-200])
        cube(400,center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-120,80,0])
    util_nacelle(180,24,24,curved=true);
    

}

mvm_command();

module mvm_scout() {
    mvm_command();
}

