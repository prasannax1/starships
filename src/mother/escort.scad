use <../lib/util.scad>;
include <common.scad>;


escort_width=120;
escort_length=300;
escort_height=25;

module quarter_escort() {
    util_ovoid(escort_length/3, escort_length/6, escort_width/2, 2, escort_height-1, faces=5);
}

module half_escort() {
    util_mirrored([0,1,0])
    translate([0,escort_width/5, 0])
    scale([1,.75,1])
    quarter_escort();
}

module escort_unpos() {
    difference() {
        hull() {
            translate([escort_length/4,0,0])
            half_escort();

            translate([-escort_length/4,0,0])
            half_escort();
        }

        translate([-escort_width/2-escort_length/3+5,0,0])
        cube(escort_width, center=true);
        
        translate([escort_length/2+25,0,0])
        cube(25, center=true);
    }



    util_mirrored([0,1,0])
    translate([0,escort_width/4,0])
    rotate([15,0,0])
    hull() {
        util_mirrored([1,0,0])
        translate([escort_length/4,0,0])
        scale([.5,.75, 1.25]) quarter_escort();
    }
}

module escort_pos() {
    translate([-body_length_b-body_length_f-100,0,-body_width/2-saucer_height/2-carrier_center_offset])
    children();   
}

module escort() {
    escort_pos() escort_unpos();
}

escort();