use <util.scad>;

module corvette() {
    difference() {
        translate([5,0,0]) {
            util_nacelle(50,40,7.5,curved=true);
            scale([1,1,.66])
            util_nacelle(50,40,7.5,curved=true,up=false);
        }

//        translate([24.5,0,0])
//            rotate([0,-15,0])
//                cube(40,center=true);
    }

    util_mirrored([0,1,0])
        translate([-0,-10,4])
            rotate([-63,0,0])
                rotate(180)
                    translate([0,0,-1.5])
                    util_nacelle(50,5,15,curved=true,up=false);
}

corvette();

