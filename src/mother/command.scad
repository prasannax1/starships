use <../lib/util.scad>;
include <common.scad>;
use <secondaries.scad>;

module command_disk_plus() {
    disk_2();

    translate([-bridge_width/2,0,command_height])
    difference() {
        intersection() {
            translate([-scout_width/4,0,0])
            scale([1,1,.6])
            rotate([0,90,0])
            cylinder(d=bridge_width, h=scout_width/2, center=true, $fn=faces_rough);

            scale([1,1,.3])
            rotate([90,0,0])
            cylinder(d=scout_width, h=scout_width, center=true, $fn=faces_concave);
        }

        util_mirrored([0,0,1])
        translate([-scout_width/4,0,scout_width/2+scout_height])
        cube(scout_width, center=true);
        
        translate([-scout_width/2, 0, 0])
        cube([10, 20, 12], center=true);
    }
    
    translate([-scout_width*.57,0,command_height])
    scale([1.2,1,1])
    rotate([90,0,0])
    cylinder(d=12.5, h=22, center=true, $fn=faces_rough);
    
    translate([-command_width/2,0,0])
    translate([40,0,7.5/2])
    cube([80,80,7.5], center=true);
}

module command() {
    command_disk(body_attached=true);
    translate([-command_width/2,0,0]) sec_body();
}


module command_disk(body_attached=false) {
    difference() {
        command_disk_plus();
        if (body_attached == false) {
            command_disk_minus();
        }
    }
}

module command_disk_minus() {
    translate([-command_width/2,0,0])
    hex();
}

command_disk();