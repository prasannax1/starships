use <util.scad>;
use <macs.scad>;

module sci_sensors() {
    translate([-8,0,2.4])
    util_saucer(10,10,1);
}


module sci_main() {
    macs_science_vessel();
    sci_sensors();
}

module science() {
    scale(1) sci_main();
}

module sci_msd() {
    projection(cut=true)
    rotate([-90,0,0])
    union() {
        sci_saucer();
        sci_body();
        sci_sensors();
        translate([-10,0,-5]) {
            util_nacelle(40,7.5,5,up=false,curved=true);
            util_nacelle(40,7.5,.75,up=true, curved=true);
        }
    }
}

science();

//sci_msd();