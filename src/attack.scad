use <util.scad>;
module at_main_body() {
    util_saucer(80,40,10);
    util_body(80,40,5,10);
}

module at_main_minus() {
    translate([-54,0,-10])
        rotate([0,15,0])
            cube([80,29,80], center=true);

    translate([40.5,0,-2.5])
        sphere(1.5, $fn=16);

    translate([35.5,0,6])
        rotate([0,-62.5,0])
            cube([5,5,10], center=true);

}

module at_nacelle_assembly() {
    util_mirrored([0,1,0])
        translate([5,12,4])
            rotate([45,0,0])
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
            union() {
                at_main();
                translate([5,0,-6])
                    at_nacelle_2();
            }
}

module attack() {
    scale(.75) at_main();
}

attack();

//at_msd();
