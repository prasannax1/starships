use <../lib/util.scad>;
use <macs.scad>;

module macs_medevac() {
    translate([4,0,0]) union() {
        translate([0,0,.5]) macs_extra_room();
        translate([0,0,-1.95]) macs_disk(16);        
        translate([4+1.25, 0, .5]) macs_pod();
        translate([-12,0,.5]) macs_large_warp(up=true);
        translate([-21.25,0,.5]) mirror([1,0,0]) macs_pod();
    }
}


module med_sensors() {
    translate([-8,0,2.4])
    util_saucer(10,10,1);
}


module med_main() {
    macs_medevac();
    med_sensors();
}

module medevac() {
    scale(1) med_main();
}

module med_msd() {
    projection(cut=true)
    rotate([-90,0,0])
    union() {
        sci_saucer();
        sci_body();
        med_sensors();
        translate([-10,0,-5]) {
            util_nacelle(40,7.5,5,up=false,curved=true);
            util_nacelle(40,7.5,.75,up=true, curved=true);
        }
    }
}

medevac();

module hospital() {
    medevac();
}

//sci_msd();