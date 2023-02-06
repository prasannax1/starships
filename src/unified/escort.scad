use <disks.scad>
use <engines.scad>
use <../lib/util.scad>
include <common.scad>

module escort() {
    h_adj=disk_1_height-2*disk_0_deck_h;
    translate([0,0,h_adj-.02]) disk_0();
    
    translate([0,0,h_adj*1/6+.01])
    cylinder(d=disk_1_width, h=h_adj*1/3, center=true, $fn=faces_rough);

    util_mirrored([0,1,0])
    translate([0,disk_1_width*.25,class_2_nacelle_w/2])
    rotate([-90,0,0])
    class_2_nacelle();

    difference() {
        translate([0,0,class_2_nacelle_w/2])
        scale([1.5,1,1])
        cylinder(d1=disk_1_width, d2=disk_1_width/2, h=class_2_nacelle_w*.5, center=true, $fn=9);
        
        cylinder(d=disk_0_upper_d*2, h=50, center=true, $fn=faces_concave);
        
        translate([disk_1_width*.75,0,0])
        rotate(30)
        cylinder(d=disk_1_width*.5, h=50, center=true, $fn=6);
        
        translate([-disk_1_width/2-5,0,12])
        cube([20,15,6], center=true);
    }

    translate([-disk_1_width/2-2.5,0,9])
    cube([20,15,.25], center=true);
}

escort();
