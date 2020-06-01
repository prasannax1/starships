use <../lib/util.scad>;

module tactical_old() {
    rotate(180) {
        difference() {
            translate([5,0,0]) {
                util_nacelle(20,16,3.2,curved=true);
                scale([1,1,.66])
                    util_nacelle(20,16,3.2,curved=true,up=false);
            }


        }

        util_mirrored([0,1,0])
            translate([0,-3,1])
                rotate([-75,0,0])
                    rotate(180)
                        translate([0,0,-1.5])
                            scale([.5,.5,.75])
                                util_nacelle(40,5,10,curved=true,up=false);
    }
    

}

module tactical() {
    util_ovoid(16,7,10,3,1, faces=10);

    util_mirrored([0,1,0])
    translate([-2,-3,.5])
    rotate([110,0,0])
    util_ovoid(5,14,2,6,0.5, faces=8);
}




tactical();

