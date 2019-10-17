use <util.scad>;

module scout_dish() {
    difference() {
        union() {
            difference() {
                util_saucer(80,40,7.5);
                translate([40,0,0])
                    rotate([0,-60,0])
                        cube([5,5,60],center=true);
            }
            translate([0,0,.25]) scale(.95) util_saucer(80,40,7.5);
        }
        
        translate([-50,0,0])
            rotate([0,-45,0])
                cube([60,60,60], center=true);
        
//        util_mirrored([0,1,0])
//            translate([0,20,-1])
//                rotate([-45,0,0])
//                    cube([80,10,10],center=true);   
        
        
    }
    
    
}

module scout_nacelle() {
difference() {
scale([1.2,1,2])
difference() {
rotate([30,0,0])
rotate([0,90,0])
cylinder(40,2.5,2.5,center=true,$fn=6);
    
    translate([0,0,5])
    cube([50,10,10],center=true);
    
}

translate([25,0,0])
rotate([0,-30,0])
cube(10,center=true);

translate([-25,0,-5])
rotate([0,-30,0])
cube(10,center=true);
}

translate([20,0,-2.5])
sphere(1.5,$fn=16);
}

module scout_nacelle_assembly() {
    util_mirrored([0,1,0])
        translate([-18,17,0])
            scout_nacelle();
    

}

module scout_body() {
    translate([-5,0,2]) {
        util_nacelle(24,36,5,curved=true,up=true);
        util_nacelle(24,36,5,curved=true,up=false);
    }
}

module scout_main() {
    scout_dish();
    scout_body();
    scout_nacelle_assembly();
}

module scout() {
    scale(1) scout_main();
}

module scout_msd() {
    projection(cut=true)
    rotate([-90,0,0])
    union() {
        scout_dish();
        scout_body();
        translate([-30,0,5]) util_nacelle(48,9,7.5, curved=true);
    }
}

scout();

//scout_msd();