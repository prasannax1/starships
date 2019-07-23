use <util.scad>;

module at_lower_body() {
    difference() {
        util_body(80,40,5,10);
        translate([-18,0,0])
            cube (44, center=true);
    }
}

module at_main_body() {
    util_saucer(80,40,10);
    
    at_lower_body();    
    translate([35,0,0])
        mirror([1,0,0])  
            at_lower_body();
}

module at_main_minus() {

    translate([-45,0,10])
        rotate([-0,30,0])
            cube([80,29,80], center=true);

    translate([40,0,-2.5])
        sphere(1.5, $fn=16);

    translate([37.75,0,4.75])
        rotate([0,-57.5,0])
            cube([5,7.5,5], center=true);
}

module at_nacelle_assembly() {
    util_mirrored([0,1,0])
        translate([5,12,4])
            rotate([45,-0,0])
                at_nacelle_2();
}

module at_nacelle_2() {
    
        util_nacelle(45,7.5,12,curved=true,up=false);
}


module at_main() {
    union() {
        difference() {
            at_main_body();
            at_main_minus();
        }
        at_nacelle_assembly();
    }
}

module at_msd() {
    projection(cut = true)
        rotate([-90,0,0])
            rotate(-90) union() {
                at_main();
                translate([0,5,-6])
                    at_nacelle_2();
            }
}

module attack() {
    scale(.8) at_main();
}

attack();

//at_main_minus();

//at_msd();
