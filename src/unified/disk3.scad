use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>
use <disk1.scad>

module disk_3_minus() {    
    translate([0,0,disk_3_height])
    cylinder(d1=disk_1_width, d2=disk_1_width+13.33, h=6.5, center=true, $fn=faces_concave);
    
    translate([-.35*disk_3_width-disk_3_height/2+5, 0, disk_3_height-7])
    cube([10,64,10], center=true);
    
    cylinder(d=.75*disk_3_width, h=.5, center=true, $fn=faces_concave);
    
    util_mirrored([0,1,0])
    translate([-.45*disk_3_width-10, .6*disk_1_width, .25*disk_0_width])
    scale([.5,1,.5]) 
    sphere(d=disk_0_width*.5, $fn=faces_convex);
}



module disk_3_plus() {
    intersection() {
        scale([1,1,(disk_3_height+disk_1_height*.25)*2/disk_3_width])
        sphere(d=disk_3_width, $fn=faces_concave);

        translate([0,0,disk_3_height/2-.01])
        cube([disk_3_width*1.2, disk_3_width*1.2, disk_3_height], center=true);
        
        translate([-.45*disk_3_width,0,0])
        translate([.6*disk_3_width,0,0])
        cube(1.2*disk_3_width, center=true);
    }

    translate([-.35*disk_3_width/2,0, disk_3_height/2])
    cube([.35*disk_3_width, .75*disk_1_width, disk_3_height], center=true);

    translate([-.35*disk_3_width,0,disk_3_height/2])
    rotate([90,0,0])
    cylinder(h=.75*disk_1_width, d=disk_3_height, center=true, $fn=faces_convex);
    
    util_mirrored([0,1,0])
    translate([-.45*disk_3_width, .6*disk_1_width, .25*disk_0_width])
    scale([1,1,.5]) 
    intersection() {
        sphere(d=disk_0_width, $fn=faces_convex);
        
        translate([-10,0,0])
        translate([disk_0_width/2,0,0])
        cube(disk_0_width, center=true);
    }
}


module disk_3() {
    difference() {
        disk_3_plus();
        disk_3_minus();
    }
    
    translate([0,0,disk_3_height-3.35]) disk_1();
    
    translate([-disk_3_width*.3,0,disk_3_height-.01-2.5]) rotate(180) disk_0();
    
    translate([-.35*disk_3_width,0,disk_3_height/2])
    rotate([90,0,0])
    cylinder(h=.75*disk_1_width, d=disk_3_height-1, center=true, $fn=faces_rough);
}

disk_3();