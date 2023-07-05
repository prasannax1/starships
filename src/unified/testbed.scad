use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;

module proto() {
    disk_0();
    
    proto_secondary();
}

module proto_secondary() {
    translate([0,0,-5+.01])
    class_0_hangars();

    util_mirrored([0,1,0])
    translate([-disk_0_width/4,2.75,-5])
    class_0_secondary();

    util_mirrored([0,1,0])
    translate([-disk_0_width*1.25,disk_0_width/2-2.5,10])
    rotate([90,0,0])
    class_0_double_nacelle();


    util_mirrored([0,1,0])
    translate([0,-2.5,-5])
    rotate([45,0,0])
    translate([-disk_0_width*1.2,0,0])
    translate([0,0,disk_0_width/4-.01])
    cylinder(d=3.6, h=disk_0_width/2, center=true, $fn=faces_rough);
}


proto();