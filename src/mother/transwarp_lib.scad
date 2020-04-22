use <../lib/util.scad>;
use <common.scad>;

nacelle_height=75;

module mtw_main_body() {
    difference() {
        util_ovoid(220,320,200,60,110);

        translate([750/2,0,750/2])
        cube(750,center=true);

        translate([-750/2-160, 0, -(750/2)-10])
        cube(750, center=true);

        translate([0,0,80])
        rotate([90,0,0])
        cylinder(750,80,80,center=true);

        translate([-160,0,-125])
        scale([160/115,1,1])
        rotate([90,0,0])
        cylinder(750,115,115,center=true);
        
        translate([-270,0,50])
        difference() {
            cylinder(100,50,100,center=true);
            translate([150,0,0])
            rotate([0,45,0])
            cube([150,150,500], center=true);
        }
        
        translate([220,0,-50])
        rotate([0,-90,0])
        cylinder(100,60,10,center=true);
    }
}

module mtw_neck() {
    difference() {
        union() {
            difference() {    
                translate([0,0,-.01])
                mvm_mtw_neck_common();

                translate([0,0,61])
                rotate([90,0,0])
                cylinder(750,80,80,center=true);

                translate([-750/2,0, 750/2])
                cube(750,center=true);
                

            }
            
            intersection() {
                mvm_mtw_neck_common();
                util_ovoid(220,320,200,60,110);
            }
            
            translate([100,0,70])
            util_ovoid(100,25,120,1,15);
        }
            
        translate([250,0,61-.02])         
        translate([-100,0,.01])
        util_mirrored([0,0,1])
        util_nacelle(240, 60,35, curved=true, up=false);
    }

}


module mtw_bar_shape() {
    hull() {
        util_ovoid(220,320,200,5,5);

        translate([-100,0,nacelle_height])
        cube([750,500,1],center=true);
    }
}

module mtw_nacelle_bar() {
    difference() {
        translate([0,0,-6])
        difference() {
            mtw_bar_shape();
            scale([.95,.95,1.05]) mtw_bar_shape();
        }

        translate([750/2,0,0])
        cube(750, center=true);

        translate([-320-700/2,0,0])
        cylinder(600,700/2,700/2,center=true);

        translate([-320,0,40])
        cube(80,center=true);

        util_mirrored([0,1,0]) 
        translate([0,100+950/2,0])
        cylinder(600,950/2,950/2,center=true);
    }
}

module mtw_nacelles() {
    util_mirrored([0,1,0]) {
        translate([-365,250,nacelle_height])
        util_ovoid(75,90,64,5,15);

        translate([-270,250,nacelle_height])
        util_ovoid(250,500,100,64,5);
    }
}

module mvm_transwarp_full() {
    mtw_main_body();
    mtw_neck();
    translate([250,0,61-.02]) 
    mtw_saucer();
    mtw_nacelle_bar();
    mtw_nacelles();
}
module mvm_transwarp() {
    mtw_main_body();
    mtw_neck();
    mtw_nacelle_bar();
    mtw_nacelles();
}
module mvm_transwarp_separate() {
    mtw_main_body();
    mtw_neck();
    translate([250,0,150]) 
    mtw_saucer();
    mtw_nacelle_bar();
    mtw_nacelles();
}
mvm_transwarp_full();