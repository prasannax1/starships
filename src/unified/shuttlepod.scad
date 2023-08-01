use <../lib/util.scad>;
use <smalls.scad>;

module shuttlepod() {
    shuttlepod_body();

    util_mirrored([0,1,0])
    translate([.5,1.28,-.2]) nacelle_0();
}

shuttlepod();