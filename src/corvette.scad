use <util.scad>;

module corvette() {
    difference() {
        translate([5,0,0]) {
            util_nacelle(40,40,4,curved=true);
            util_nacelle(40,40,4,curved=true,up=false);
        }

        translate([25,0,0])
            rotate([0,-15,0])
                cube(40,center=true);
    }

    util_mirrored([0,1,0])
        translate([-0,-10,1.6])
            rotate([-75,0,0])
                rotate(180)
                    util_nacelle(40,3.6,15,curved=true,up=false);
}

corvette();

