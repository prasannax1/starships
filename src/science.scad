use <util.scad>;

module sci_main() {
    util_mirrored([0,1,0])
        translate([-10,4,0])
            mirror([1,0,0])
                util_nacelle(30,11,5.5,curved=true);

    translate([-10,0,0])
        mirror([1,0,0])
            mirror([0,0,1])
                util_nacelle(29,22,5,curved=true, up=false);
    
    translate([-10,0,0])
        mirror([1,0,0])
            util_nacelle(29,22,1,curved=true, up=false);

    util_mirrored([0,1,0])
        translate([17.5,4,0])
            util_nacelle(27,4,1,curved=true,up=false);
}

module science() {
    scale(1) sci_main();
}

science();