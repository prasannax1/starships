use <util.scad>;

module dip_saucer() {
    difference() {
        util_saucer(27,27,5);
        dip_body();
        translate([13.5,0,2])    
            cube(5, center=true);
    }
    
}

module dip_body() {
    difference() {
        translate([-9,0,2])
            mirror([0,0,1])
                util_saucer(18,12,7);
        
        union() {
            translate([-9,0,-12.5])
                cube(18, center=true);
            
            translate([-1,0,-1.5])
                sphere(1.2, $fn=16);
            
            translate([-17,0,-3])
                rotate([90,0,0])
                    cylinder(12,4,4, center=true);
        }
    }
}

module dip_nacelle_assembly() {
    translate([-15,0,1])
        util_nacelle_bar(24,5,3,.5);
    
    util_mirrored([0,1,0])
        translate([-12.5,11,4])
            util_nacelle(18,5,3,curved=true);
}

module dip_main() {
    dip_saucer();
    dip_body();
    dip_nacelle_assembly();
}

module diplomat() {
    scale(1) dip_main();
}

diplomat();