include <common.scad>
use <../lib/util.scad>
use <disk1.scad>
use <engine1.scad>
use <engine0.scad>

module scout_alt() {
    disk_1();

    util_mirrored([0,1,0]) {
        translate([-disk_1_width/4,disk_1_width/4,0])
        class_0_secondary();

        translate([-disk_1_width/6,disk_1_width/4+class_1_nacelle_w,-class_1_nacelle_w])
        rotate([45,0,0])
        class_1_nacelle();
        
        translate([-disk_1_width/4,disk_1_width/4,0])
        rotate([45,0,0])
        cube([class_1_nacelle_w,2,disk_1_height], center=true);
    }
}

scout_alt();