use <../lib/util.scad>;

module mvm_back_hangar() {
    difference() {
        util_saucer(640,270,75);

        translate([750/2,0,0])
            cylinder(500,750/2,750/2,center=true);

        translate([0,0,500+60])
            cube(1000, center=true);

//        translate([50,0,40])
//            cube([100,120,100],center=true);
    }

    translate([-164,0,59])
    util_saucer(48,48,10);
    
    util_mirrored([0,1,0])
        translate([-90,60,60])
            mirror([1,0,0])
                    util_nacelle(200,30,12.5,curved=true);


}

rotate(180) mvm_back_hangar();

module mvm_hangar() {
        rotate(180) mvm_back_hangar();
}
