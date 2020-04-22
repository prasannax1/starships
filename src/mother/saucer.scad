use <../lib/util.scad>;
use <common.scad>;

module mvm_saucer_plus() {
    difference() {
        util_ovoid(750/2, 750/2, 750, 70, 10);

        difference() {
            translate([0,0,12])
            scale([1.01,1.01,1/6])
            util_star(500, 100, 16);

            scale(.975)
            util_ovoid(750/2, 750/2, 750, 60, 10);
        }
        
        translate([0,0,750/2+60])
        cube(750, center=true);
    }
    
    intersection() {
        difference() {
            util_nacelle(750,240,80,curved=true);
            translate([0,0,750/2+60])
            cube(750, center=true);
        }
        
        union () {
            cube(750, center=true);
        
            translate([-750/2+11-.01,0,80-.01])
            rotate([90,0,0])
            cylinder(750,80,80,center=true);
        }
    }
    
    translate([125,0,58])
    util_ovoid(60,60,120,10,5);
    
    translate([125,0,67])
    util_ovoid(15,40,30,4,4);
    
}

module mvm_saucer_minus() {
    hull() {
        translate([-750/2+11,0,0])
        util_ovoid(220,320,200,1,110);
        
        translate([0,0,-20-.01])
        cylinder(40,80,80,center=true);
    }
    
    translate([-750/2+11,0,0])
    mvm_mtw_neck_common();
}

module mvm_saucer() {
    difference() {
        mvm_saucer_plus();
        mvm_saucer_minus();
    }
}

mvm_saucer();