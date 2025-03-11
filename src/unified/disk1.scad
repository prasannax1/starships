use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>

h_adj=disk_1_height-2*disk_0_deck_h;
module disk_1_plus(){
    
    translate([0,0,h_adj/6])
    cylinder(d1=disk_1_width-2*h_adj/3, d2=disk_1_width, h=h_adj/3, center=true, $fn=faces_convex);
    
    translate([0,0,h_adj/3+h_adj/3-.01])
    cylinder(d1=disk_1_width, d2=disk_1_width/2, h=2*h_adj/3, center=true, $fn=faces_convex);
    
    translate([0,0,h_adj-.02]) disk_0();
    
    translate([0,0,h_adj/2])
    scale([1,4,.75])
    rotate([0,-90,0])
    translate([0,0,disk_1_width*.48/2])
    rotate(180)
    cylinder(d=h_adj, h=disk_1_width*.48, center=true, $fn=5);
    
    translate([0,0,.01]) disk_0_under();
}

module disk_1_minus() {
    translate([-disk_1_width*.48,0,disk_1_height*.4])
    rotate([90,0,0])
    cylinder(d=disk_0_deck_h*.75, h=disk_1_height*1.5, center=true, $fn=faces_rough);
    
    util_mirrored([0,1,0])
    util_repeat_rot(15, [0,0,9])
    translate([disk_1_width/2-3,0, 1.5])
    window();
}


module disk_1(ball=true) {
    difference() {
        disk_1_plus();
        disk_1_minus();
    }
    
    if(ball) {
        translate([0,0,disk_1_height-disk_0_deck_h*.75])
        sphere(d=disk_0_upper_d*.8, $fn=faces_convex);
        
        translate([0,0,-disk_0_deck_h*1.5])
        sphere(d=disk_0_upper_d*.8, $fn=faces_convex);
    }
}

disk_1();