use <util.scad>;

module y_body() {
    difference() {
        util_saucer(40,40,5);
        y_minus();
    }
}

module y_minus() {
    translate([-35,0,5])
        rotate([0,30,0])
            cube(40, center=true);

    util_mirrored([0,1,0])
        translate([0,20,5])
            rotate([45,0,0])
                cube([40,20,20], center=true);
    
    translate([15,0,5])
        rotate([0,-75,0])
            cube([5,5,10], center=true);
}

module y_nacelle_assembly() {
    util_mirrored([0,1,0])
        translate([7.5,8,2])
            rotate([-45,0,0])
                util_nacelle(22,5,3,curved=true);
}

module y_main() {
    y_body();
    y_nacelle_assembly();
}

module yacht() {
    scale(1) y_main();
}

yacht();