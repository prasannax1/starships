use <../lib/util.scad>;
use <yacht-common.scad>;

module yacht_fighter() {
    dip_saucer();

    dip_body2();
    
    util_mirrored([0,1,0])
    translate([-9,5,-2])
    rotate([75,0,0])
    mirror([1,0,0])
    util_ovoid(20,12,3,2,6.4,faces=11);


}

yacht_fighter();