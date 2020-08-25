use <../lib/util.scad>;
use <yacht-common.scad>;

module dip_main() {
    dip_saucer();
    dip_body();
    dip_nacelle_assembly();
}

module yacht() {
    scale(1) dip_main();
}

yacht();

