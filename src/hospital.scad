use <util.scad>;
use <macs.scad>;

module hos_main() {
    macs_hospital_ship();
}

module hospital() {
    scale(1) hos_main();
}

module hos_msd() {
    projection(cut=true) rotate([-90,0,0]) union() {
        hos_saucer();
        hos_body();
        translate([-10,0,-22]) util_nacelle(40,6,6,curved=true,up=false);
    }
}

hospital();

//hos_msd();