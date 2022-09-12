use <../lib/util.scad>;
include <common.scad>;

att_width=36;
att_height=4.8;
att_ratio=.45;
att_engine_width=10;
att_engine_ratio=5;
att_engine_offset=-5;
att_nacelle_width=6;
att_nacelle_ratio=6;
att_hangar_width=18;
att_hangar_ratio=.75;
att_hangar_length=24;

module att_engine_assembly() {
    util_mirrored([0,1,0])
    translate([-att_width/3, att_width/2-att_engine_width/4,att_height/2])
    difference() {
        small_engine(att_width, att_engine_width, att_engine_ratio, att_engine_offset);
    }
}

module att_nacelle_assembly() {
    util_mirrored([0,1,0])
    translate([0,0,att_height/2])
    util_mirrored([0,0,1])
    translate([-att_width/2,att_width/2-att_engine_width/2,att_nacelle_width/4])
    rotate([-45,0,0])
    small_nacelle(att_nacelle_width, att_nacelle_ratio);
}

module attack_primary() {
    small_disk(att_width, att_height, att_ratio);
    att_engine_assembly();
    att_nacelle_assembly();
    small_hangar(att_hangar_length, att_hangar_width, att_height*1.5, att_hangar_ratio);
}

attack_primary();