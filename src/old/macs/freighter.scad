use <../lib/util.scad>;
use <macs.scad>;

module macs_freighter() {
    translate([0,0,-2]) macs_large_cargo();
    translate([20,0,5]) macs_extra_room();
    translate([-4,0,5]) macs_extra_room();
    translate([-12,0,5]) macs_extra_room();
    translate([-20,0,5]) macs_extra_room();
    translate([8,0,5]) macs_large_warp();
    translate([25.25,0,5]) macs_pod_small();
}

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