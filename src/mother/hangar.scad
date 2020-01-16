use <../lib/util.scad>;

module mvm_back_hangar() {
    difference() {
        union () {
            util_saucer(640,270,80);
            translate([-25,0,75]) util_saucer(48,48,10);
        }

        translate([750/2,0,0])
            cylinder(500,750/2,750/2,center=true);

        translate([0,0,500+90])
            cube(1000, center=true);

//        translate([50,0,40])
//            cube([100,120,100],center=true);
    }
    

    util_mirrored([0,1,0])
        translate([-50,100,70])
            mvm_hangar_nacelle();
    
    translate([-50,0,60])
    util_nacelle_bar(210,10,25,5);

}

module mvm_hangar_nacelle() {
    scale ([1,1.5,.75]) {
        util_mirrored([1,0,0]) translate([50,0,0]) sphere(10);
        rotate([0,90,0]) cylinder(100,10,10,center=true);
    }
}


rotate(180) mvm_back_hangar();

module mvm_hangar() {
        rotate(180) mvm_back_hangar();
}
