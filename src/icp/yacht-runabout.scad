use <../lib/util.scad>;
use <yacht-common.scad>;

module yacht_runabout() {
    dip_saucer();

    dip_body2();

    util_mirrored([0,1,0])
    translate([0,10,-5])
    scale([1,2,1])
    rotate([0,90,0]) {
        util_mirrored([0,0,1])
        translate([0,0,10]) sphere(1.5, $fn=16);
        cylinder(h=20,r=1.5,center=true, $fn=16);
    }

    translate([-8,0,0])
        mirror([0,0,1])
        util_nacelle_bar(24,5,3,.5);
}

yacht_runabout();