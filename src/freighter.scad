use <util.scad>;
use <macs.scad>;

module freighter_main() {
    macs_freighter();
}

module freighter() {
    scale(1) freighter_main();
}

module hos_msd() {
    projection(cut=true) rotate([-90,0,0]) union() {
        hos_saucer();
        hos_body();
        translate([-10,0,-22]) util_nacelle(40,6,6,curved=true,up=false);
    }
}

freighter();

//hos_msd();