use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>
use <disk1.scad>



module disk_2_plus() {
    translate([0,0,disk_2_deck-.01])
    cylinder(d1=disk_2_width, d2=disk_2_width-4*disk_2_deck, h=2*disk_2_deck+.02, center=true, $fn=faces_convex);
    
    translate([0,0,4*disk_2_deck-.02])
    cylinder(d1=disk_2_width-4*disk_2_deck, d2=disk_1_width+disk_2_deck*16, h=4*disk_2_deck+.02, center=true, $fn=faces_convex);
    
    translate([-disk_2_width/4-2*disk_2_deck,0,3*disk_2_deck])
    cube([disk_2_width/2, disk_1_width/2, 6*disk_2_deck], center=true);
}

module disk_2_minus() {
    translate([0,0,6*disk_2_deck])
    cylinder(h=2*disk_2_deck, d1=disk_1_width, d2=disk_1_width+4*disk_2_deck, center=true, $fn=faces_concave);
    
    translate([-disk_2_width/2+2*disk_2_deck,0,0])
    rotate([0,-45,0])
    translate([-disk_1_width/2,0,0])
    cube(disk_1_width, center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_2_width/2-2*disk_2_deck,disk_1_width/4-disk_2_deck, disk_2_deck*5])
    sphere(d=4, $fn=faces_rough);

    util_mirrored([0,1,0])
    translate([-disk_2_width/2-2*disk_2_deck,disk_1_width/4-disk_2_deck*3, disk_2_deck*5])
    sphere(d=4, $fn=faces_rough);
    
    util_mirrored([0,1,0])
    rotate(155)
    translate([disk_2_width/2-2*disk_2_deck,0,3*disk_2_deck])
    cube([42, 20, 2*disk_2_deck], center=true);
    
    util_mirrored([0,1,0])
    util_repeat_rot(40,[0,0,4])
    translate([disk_2_width/2-disk_2_deck,0,disk_2_deck*.5]) window();
    
    translate([disk_2_width/2-disk_2_deck,0,disk_2_deck*.5]) scale([1,5,1]) window();
    
    util_mirrored([0,1,0])
    util_repeat_rot(18,[0,0,9]) {
        translate([disk_2_width/2-2*disk_2_deck,0,disk_2_deck*1.5]) window();
        
        rotate(2)
        translate([disk_2_width/2-2*disk_2_deck,0,disk_2_deck*1.5]) window();
    }
   
}


module disk_2() {
    difference() {
        disk_2_plus();
        disk_2_minus();
    }
    
    translate([0,0,5*disk_2_deck]) disk_1();
    
    util_mirrored([0,1,0])
    rotate(155)
    translate([disk_2_width/2-2*disk_2_deck-10.5,0,2*disk_2_deck])
    cube([20, 19.5, .5], center=true);
}


disk_2();