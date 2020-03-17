use <../lib/util.scad>;


module mvm_command() {
    translate([0,0,10])
    util_saucer(150,150,15);
    
    difference() {
        translate([-150/2,0,15/2])
        scale([.66,2,1])
        cylinder(15,60,75,center=true,$fn=3);
        
        util_mirrored([0,1,0])
        translate([-90,110,60])
        rotate([60,0,0])
        cube(150,center=true);
    }
    
    translate([0,0,10])
    util_nacelle(90,64,20,curved=true);
    
    util_mirrored([0,1,0])
    difference() {
        translate([-64,55,0])
        rotate([90,0,0])
        util_nacelle(120,20,20,curved=true, up=false);
        
        translate([0,0,-500])
        cube(1000,center=true);
    }
}

mvm_command();

module mvm_scout() {
    mvm_command();
}

