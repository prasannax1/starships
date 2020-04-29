use <../lib/util.scad>;
mvm_tw_nacelle_height=80;

module mvm_tw_main_body(standalone=false) {
    difference() {
        union() {
            util_ovoid(250,300,180,1,100);
            util_ovoid(250,300,300,60,1);
        }

        union() {
            translate([0,0,60])
            rotate([90,0,0])
            cylinder(500,60,60, center=true);

            translate([250,0,250])
            cube(500, center=true);
        }

        union() {
            translate([-150,0,-100])
            scale([1.2,1,1])
            rotate([90,0,0])
            cylinder(500, 100, 100, center=true);

            translate([-250-150,0,-250])
            cube(500, center=true);
        }
        
        translate([-250-285,0,0])
        rotate([0,30,0])
        translate([0,0,100])
        cube(500,center=true);
        
        translate([250,0,-40])
        rotate([0,90,0])
        cylinder(120,7.5,50,center=true);
    }

    difference() {
        util_ovoid(250,300,360,15,15);
        mvm_tw_rear_dock(standalone);
    }
}


module mvm_tw_rear_dock(standalone=false) {
    translate([-175,0,-57])
    cylinder(100,80,80,center=true);

    translate([-175-80,0,-87])
    cube(160,center=true);
}


module mvm_tw_pos(standalone=false) {
    mvm_tw_main_body(standalone);
    mvm_tw_nacelle_bar(standalone);
    util_mirrored([0,1,0])
    mvm_tw_nacelles(standalone);
    mvm_tw_neck(standalone);
}

module mvm_tw_nacelle_bar(standalone=false) {
    rear_radius=750;
    side_radius=320;
    height=mvm_tw_nacelle_height;
    width=600;
    difference() {
        hull() {
            translate([0,0,height])
            cube([1000,width,1], center=true);
            translate([0,0,-0])
            util_ovoid(250,300,360,1,15);
        }

        hull() {
            translate([0,0,height+2])
            cube([970,width-30,1],center=true);
            translate([0,0,-2])
            util_ovoid(200,240,300,1,1);
        }
        
        translate([500,0,0])
        cube(1000,center=true);
        
        translate([-rear_radius-300,0,0])
        cylinder(600,rear_radius, rear_radius, center=true);

        util_mirrored([0,1,0])
        translate([0,side_radius+180, 0])
        cylinder(600,side_radius/2,3*side_radius/2, center=true);
        
        translate([-300,0,175/2])
        cube(175,center=true);
        
        mvm_tw_rear_dock(standalone);
    }
}

module mvm_tw_nacelles(standalone=false) {
    translate([-300,275,mvm_tw_nacelle_height])
    util_ovoid(100,100,50,1,24);

    translate([-250,275,mvm_tw_nacelle_height])
    util_ovoid(250,500,100,50,15);
}

module mvm_tw_neck_common(standalone=false) {
    difference() {
        translate([0,0,60])
        mirror([0,0,1])
        util_saucer(600, 64, 120);

        translate([-350,0,-100])
        rotate([0,-30,0])
        cube(600,center=true);

        translate([-445,0,100])
        rotate([0,45,0])
        cube(600,center=true);
    }
}

module mvm_tw_neck_uncommon(standalone=false) {
    scale([250/80,1,.8])
    rotate([90,0,0])
    cylinder(r=80, h=500, center=true);
}

module mvm_tw_neck(standalone=false) {
    intersection() {
        mvm_tw_neck_common(standalone);
        mvm_tw_neck_uncommon(standalone);
    }
}

module mvm_sc_body(standalone=false) {
    
    difference() {
        intersection() {
            union() {
                difference() {
                    mvm_tw_neck_common(false);
                    scale(.99) mvm_tw_neck_uncommon(false);
                }
                
                translate([750/2,0,60-.01])
                util_nacelle(300,95,30,curved=true);
            }

            translate([250,0,60])
            cylinder(120,150,50,center=true);
        }
        
//        translate([200,0,0])
//        cube([400,400,50], center=true);
        if (standalone == true) {
            translate([297,0,45])
            rotate([90,0,0])
            cylinder(100, 4.5, 4.5, center=true, $fn=8);
        }
    }
}

module mvm_sc_saucer(standalone=false) {
    translate([750/2,0,60-.01])
    util_saucer(250,250,25);
    
    translate([750/2, 0, 60+27/2])
    cylinder(24,120,64,center=true);
    
    translate([750/2,0,60+25])
    util_ovoid(20,40,40,5,3);
}

module mvm_sc_pos(standalone=false) {
    mvm_sc_body(standalone);
    mvm_sc_saucer(standalone);
    util_mirrored([0,1,0])
    mvm_sc_nacelles(standalone);
}

module mvm_scout() {
    translate([-250, 0, -60]) mvm_sc_pos(true);
}

module mvm_sc_nacelles(standalone=false) {
    translate([220,26,71])
    rotate([-40,0,0])
    util_nacelle(180,35,36,curved=true);
}

module mvm_transwarp() {
    translate([0,0,0]) mvm_tw_pos(true);
}

module mvm_transwarp_full() {
    translate([0,0,0]) {
        mvm_tw_pos(true);
        mvm_sc_pos(true);
    }
}

module mvm_transwarp_escort() {
    mvm_tw_pos(true);
    translate([-750/2-175,0,-2.5+.01])
    mvm_esc_pos(false);
}

module mvm_disk_plus(standalone=false) {
    intersection() {
        translate([750/2,0,0]) {
            difference() {
                util_ovoid(750/2, 750/2, 750, 70, 20);

                translate([0,0,10])
                difference() {
                    scale([1,1,20/120])
                    util_star(400,120,16);

                    cylinder(40,750/2, 750/2-40, center=true);
                }
                
                translate([0,0,400+60])
                cube(800, center=true);
            }

            difference() {
                util_nacelle(750, 360,80, curved=true);

                translate([0,0,400+60])
                cube(800, center=true);
            }
        }

        union() {
            translate([0-.01,0,60])
            rotate([90,0,0])
            cylinder(500,60,60, center=true);

            translate([400,0,0])
            cube(800, center=true);
        }
    }
    
    translate([750/2+160,0,60])
    util_ovoid(20,20,40,4,4);
}



module mvm_disk_minus(standalone=false) {
    mvm_tw_neck_common(false);
    
    if (standalone==true) {
        util_ovoid(250,300,360,15,400);
    }
    
    hull() {
        translate([750/2, 0, -20-.01])
        cylinder(30, 90, 80, center=true);

        translate([0,0,-20-.01])
        scale([250/180,1,1])
        cylinder(30, 200, 190, center=true);
    }
}

module mother() {
    mvm_disk_pos(false);
    mvm_esc_pos(false);
    mvm_tw_pos(false);
    mvm_sc_pos(false);
}

module mvm_disk_pos(standalone=false) {
    //render() 
    difference() {
        mvm_disk_plus(standalone);
        mvm_disk_minus(standalone);
    }
}

module mvm_saucer() {
    translate([-750/2,0,0]) mvm_disk_pos(true);
}

module mvm_escort() {    
    translate([-750/2, 0, +5]) mvm_esc_pos(true);
}

module mvm_esc_pos(standalone=false) {
    translate([750/2, 0, -5+.01]) {
        difference() {
            mirror([0,0,1]) util_saucer(150,150,20);
                
            translate([-90-50,0,0])
            cube(180,center=true);
        
            translate([75,0,0])
            cube([25,25,60], center=true);
            
            if (standalone==true) {
                difference() {
                    util_ring(20,18,6);
                    
                    translate([-9.5-8,0,0])
                    cube(16,center=true);
                }

                cylinder(r=12,h=1,center=true);
            }
        }

        difference() {
            util_mirrored([0,1,0])
            translate([-7.5,36,0])
            rotate([90,0,0])
            util_nacelle(120,40,45,curved=true, up=false);
            
            translate([0,0,250])
            cube(500,center=true);
        }
    }
}

module mvm_normal_separate() {
    translate([-240,0,0]) mvm_tw_pos(true);

    translate([240,0,75]) {
        mvm_sc_pos(false);
        mvm_disk_pos(true);
        mvm_esc_pos(false);
    }
}

module mvm_escort_separate() {
    translate([-0,0,50]) {
        mvm_sc_pos(false);
        mvm_disk_pos(false);
        mvm_tw_pos(false);
    }

    translate([0,0,-50]) {
        mvm_esc_pos(true);
    }
}

module mvm_full_separate() {
    translate([-240,0,0]) mvm_tw_pos(true);

    translate([240,0,50]) mvm_disk_pos(true);

    translate([-25,0, 150]) mvm_sc_pos(true);

    translate([-75,0,-50]) mvm_esc_pos(true);
}

module m_main_sep() {
    mvm_full_separate();
}

module mvm_battle_separate() {
    translate([-240,0,0]) {
        mvm_tw_pos(true);
        mvm_sc_pos(true);
    }

    translate([240,0,-75]) {
        mvm_disk_pos(true);
        mvm_esc_pos(false);
    }
}


module mvm_scout_separate() {
    translate([-0,0,75]) {
        mvm_sc_pos(true);
    }

    translate([0,0,-75]) {
        mvm_disk_pos(false);
        mvm_esc_pos(false);
        mvm_tw_pos(false);
    }
}