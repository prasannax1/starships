use <../lib/util.scad>;

module runabout_old() {
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

module runabout() {
    difference() {
        union() {
            hull()
            util_mirrored([0,1,0])
            translate([0,2.7,0])
            util_ovoid(16,10,5,3.5,1.5, faces=10);
            
            util_ovoid(10,8,13,1.5,1,faces=10);
        }

        translate([-15/2-7,0,0])
        rotate([0,15,0])
        cube(15,center=true);
    }
}

runabout();
