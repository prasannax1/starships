use <../lib/util.scad>;


module mvm_secondary_saucer() {
    util_saucer(500,180,40);
    util_saucer(500,360,15);
}

mvm_mtw_neck_common();

module mvm_mtw_neck_common() {
    translate([0,0,35-.01])
    scale([1, 40/160, 1])
    cylinder(70,200,185,center=true);
}

module mtw_saucer() {
    translate([0,0,0]) {
        util_ovoid(180 ,180,300,30,1);
        
        util_nacelle(185,120,40,curved=true);
        
        translate([0,0,19])
        cylinder(30,60,30,center=true);

        translate([0,0,34])
        util_ovoid(15,40,30,4,4);
    }
    
    translate([-100,0,.01])
    util_nacelle(240, 50,35, curved=true, up=false);
}