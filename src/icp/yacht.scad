use <../lib/util.scad>;

module dip_saucer() {
    difference() {
        util_saucer(27,27,5);
        //dip_body();
        translate([13.5,0,2]) 
            rotate([0,-15,0])
            cube(5, center=true);
    }
    
}

module dip_body() {
    difference() {
        translate([-9,0,2])
            mirror([0,0,1])
                util_saucer(25,12,7);
        
        union() {
            translate([-9,0,-13])
                cube(18, center=true);
            
            translate([1.2,0,-1.5])
                sphere(1.2, $fn=16);
            
            translate([-21,0,-4])
                scale([2.5,1,1])
                rotate([90,0,0])
                    cylinder(12,4,4, center=true);
        }
    }
    
    difference() {
        translate([-9,0,2])
        util_ovoid(12.5,12.5,12,3.2,1);
        
        translate([-30,0,0])
        rotate([0,15,0])
        cube(25,center=true);
    }
}

module dip_body2() {
    intersection() {
        dip_body();
        util_mirrored([0,0,1]) dip_saucer();
    }
}

module dip_nacelle_assembly() {
//    translate([-19,0,0.5])
//        util_nacelle_bar(24,5,3,.5);

    
//    util_mirrored([0,1,0])
//        translate([-15,11,4])
//            util_nacelle(18,5,3,curved=true);
    
    util_mirrored([0,1,0])
    translate([-15,11,4.5])
    util_ovoid(4,20,4,2,1, faces=15);

    util_mirrored([0,1,0])
    hull() {
        translate([-16,3,0.5])
        cube([5,1,1],center=true);

        translate([-20,11,4.5])
        cube([3,1,.5], center=true);
    }
}






module dip_main() {
    dip_saucer();
    dip_body();
    dip_nacelle_assembly();
}

module yacht() {
    scale(1) dip_main();
}


yacht();

