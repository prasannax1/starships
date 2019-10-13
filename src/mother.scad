use <util.scad>;

module m_saucer() {
    translate([0,0,-25])
    union() {
        render(3) difference() {
        translate([0,0,5])
            scale([1.2,1.2,1])
                util_hangar_form(650,650,100,16,60) union () {
                    difference() {
                        util_mirrored([0,0,1])
                            util_saucer(625,625,66);
                        translate([0,0,-525])
                            cube(1000, center=true);

                    }
                }
                m_lower_bridge_assembly();
            }
        
        translate([0,0,60])
            m_upper_bridge();
    }        
}



module m_body() {
    union() {
//        difference() {
//            translate([-250,0,20]) {
//                mirror([0,0,1])
//                    util_saucer(450,100,80);                
//            }
//            
//            translate([-420,0,25])
//                scale([2.5,1,1])
//                    rotate([90,0,0])
//                        cylinder(550,50,50,center=true);
//        }
        
        difference() {
            translate([-360,0,-50]) {
                mirror([0,0,1])
                    util_saucer(450,240,75);
                util_saucer(450,240,50);
            }
            
            translate([-150,0,-68])
                rotate([0,90,0])
                    cylinder(48,6,18,center=true);

            
            translate([-520,0,-140]) scale([2,1,1]) {
                rotate([90,0,0])
                    cylinder(300,80,80,center=true);

                translate([-200,0,0])
                    cube([400,400,160],center=true);
            }
        }
    }
}



module m_bar() {
    difference() {
        util_nacelle_bar(700,90,300,7.5);
    
        translate([-555,0,0])
            rotate([0,-30,0])
                cube(900,center=true);
    
        translate([200,0,300])
            rotate([90,0,0])
                cylinder(1000,300,300,center=true);
    }
}



module m_nacelle() {
    difference() {
        union() {
            util_saucer(1240,80,40);
            mirror([0,0,1])
                util_saucer(1240,80,15);
        }
        
        union() {
            translate([450,0,0])
                cube(900, center=true);
            
            translate([-790,0,-200])
                rotate([0,45,0])
                    cube(600,center=true);
        }
    }
    
    union() {
        util_saucer(225,75,45);
        mirror([0,0,1]) 
            util_saucer(225,75,18);
    }
}

module m_nacelle_assembly() {
    translate([-525,0,-50])
        m_bar();
    util_mirrored([0,1,0])
        translate([-480,325,35])
            m_nacelle();
}

module m_upper_bridge() {
    difference() {
        util_saucer(150,150,20);
        translate([75,0,10])
            scale([1.2,1,1])
                rotate(30)
                    cylinder(60,50,50,center=true, $fn=6);
    }
}

module m_lower_bridge() {
    difference() {
        union(){
            mirror([0,0,1])
                util_saucer(150,150,15);
            util_saucer(150,150,5);
            
 
        }
        
        union(){
            translate([75,0,0])
                rotate([0,-15,0])
                    cube([25,16,25],center=true);
            
            translate([-(90+45),0,0])
                cube(150, center=true);
        }
    

    }

        
    
    util_mirrored([0,1,0])
        translate([-12,44,-7.5])
            rotate([90,0,0])
                util_nacelle(120,16,32,curved=true,up=false);
}

module m_lower_bridge_assembly() {
    translate([0,0,-45])
        m_lower_bridge();
}

module m_main() {
    m_saucer();
    m_body();
    m_nacelle_assembly();
}

module mother() {
    scale(1)  {
        m_main();
        m_lower_bridge_assembly();
    }
}

module m_main_sep() {
    difference() {
        m_saucer();
        m_lower_bridge_assembly();
    }
    
    m_body();
    m_nacelle_assembly();
    
    translate([0,0,-50])
    difference() {
        m_lower_bridge_assembly();
        //m_body();
    }
}


mother();
//m_main_sep();
//m_msd();
//m_lower_bridge_assembly();

module m_msd() {
    projection(cut=true)
    rotate([-90,0,0])
    union() {
        m_saucer();
        m_body();
        m_lower_bridge_assembly();
        translate([-400,0,50]) m_nacelle();
    }
}