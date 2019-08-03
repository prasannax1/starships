use <util.scad>;

module sci_main() {
    util_mirrored([0,1,0])
        translate([-10,4,0])
            mirror([1,0,0])
                util_nacelle(25,8,5,curved=true);

    translate([-10,0,0])
        mirror([1,0,0])
            mirror([0,0,1])
                util_nacelle(24,18,5,curved=true, up=false);

    util_mirrored([0,1,0])
        translate([12.5,4,0])
            util_nacelle(25,4,1.5,curved=true,up=false);
}

module science() {
    scale(1) sci_main();
}

science();