use <../lib/util.scad>;

module runabout() {
    rotate([0,180,0]) {
        scale([1,1,.33])
            util_nacelle(20,12,9, curved=true);
        scale([1,1,.33])
            util_nacelle(20,12,9, curved=true, up=false);
        util_mirrored([0,1,0])
            rotate([90,0,0])
                util_nacelle(18,2,8,curved=true, up=false);
    }
}

runabout();
