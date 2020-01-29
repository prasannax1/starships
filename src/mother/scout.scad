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
    translate([-90,95,0])
    util_nacelle(144,24,24,curved=true);
    
    translate([-120,0,5])
    cube([24,200,10],center=true);

}

mvm_command();

module mvm_scout() {
    mvm_command();
}

