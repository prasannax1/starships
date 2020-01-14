use <../lib/util.scad>;

module tactical() {
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


tactical();

