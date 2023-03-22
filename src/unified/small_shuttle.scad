use <smalls.scad>;
use <../lib/util.scad>;

module small_shuttle() {
    shuttle_cockpit();
    util_mirrored([0,1,0])
    translate([1.5,1,-.5]) {
        nacelle_1();
        
        translate([0,0,.75/2])
        cube([1,.2,.75], center=true);
    }
}

small_shuttle();