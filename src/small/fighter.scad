use <../lib/util.scad>;


module fighter_cabin() {
    util_mirrored([0,1,0])
    translate([0,.5,0])
    util_ovoid(4,1,1,1,.5, faces=5);
}

module fighter() {
    hull() {
        fighter_cabin();

        translate([-7.5,0,1.25])
        rotate([0,-7.5,0])
        mirror([0,0,1]) 
        scale([1,1,.5])
        fighter_cabin();

        util_mirrored([0,1,0])
        translate([-4,3,-.5])
        util_ovoid(1, 1, 2, .2, .2, faces=5);
    }
}

fighter();