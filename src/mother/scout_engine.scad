use <../lib/util.scad>;
include <common.scad>;



module scout_nacelle() {
    translate([0,0,scout_height/4]) {
        nacelle(scout_height,scout_height*.75,scout_width);

        translate([-scout_width/2*.8,0,scout_height/4])
        util_mirrored([0,1,0])
        rotate([45,0,0])
        translate([0,0,3])
        cube([10,1,6], center=true);
    }
}

module scout_neck() {
    difference() {
        translate([0,0,-scout_width/5])
        intersection() {
            rotate([90,0,0])
            cylinder(h=6+.01, d=scout_width*.75, $fn=6, center=true);

            translate([-scout_width/2+.01,0,scout_width/2-.01])
            cube(scout_width, center=true);
        }

        translate([0,0,-scout_height/2])
        scale([.25,1,1])
        sphere(d=4, $fn=faces_concave);
    }


}

module scout_engine() {
    scout_neck();
    translate([-scout_width/2,0,-scout_width/5]) scout_nacelle();
}

scout_engine();