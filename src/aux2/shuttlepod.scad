use <../lib/util.scad>;


module pod() {
    difference() {
        hull()
        util_mirrored([0,1,0]) {
            translate([0,.5,0])
            util_ovoid(2,1,1,1,.5);

            translate([.25,1,-.5])
            rotate([0,90,0])
            cylinder($fn=10, h=1.25, d=.5, center=true);
        }

        translate([0,0,-1.25])
        scale([1,1,.75])
        rotate([0,90,0])
        rotate(30)
        cylinder($fn=6, d=2.5, h=5, center=true);

        util_mirrored([0,1,0])
        translate([0,1.25+.25,.5])
        scale([1,.5,1])
        rotate([0,90,0])
        cylinder($fn=6, d=2.5, h=5, center=true);
    }
}

pod();