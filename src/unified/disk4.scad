use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>


width_ = disk_4_width - disk_4_upper;
width = width_/2;

height=disk_4_height*.8;

module disk_4_part_1() {
    rotate_extrude(convexity=2, angle=360, $fn=faces_concave)
    translate([disk_4_width/2,0,0])
    difference() {
        translate([-width/2, height/2,0])
        square([width, height], center=true);

        rotate(64)
        translate([.5*width*1.5,0,0])
        square(width*1.5, center=true);
        
        translate([-width,height/2,0])
        rotate(-45)
        translate([-width/2,0,0])
        square(width, center=true);
    }
}

height2=disk_4_height*.4;
width2 = width/2;
n=12;

module disk_4_part_2() {
    difference() {
        rotate_extrude(convexity=2, angle=360, $fn=faces_concave)
        translate([disk_4_upper/2+width2/2,0,0]) {
            square([width2, height2],center=true);
            
            util_mirrored([1,0,0])
            translate([width2/2,0,0])
            circle(d=height2, $fn=faces_rough);
        }
        
        util_repeat_rot(n-1, [0,0,360/n])
        translate([disk_4_upper/2+width2+height2/2,0,0])
        cube([10, 50, 10], center=true);
    }
    
    util_repeat_rot(3, [0,0,360/4])
    translate([disk_4_upper/2, 0, -2+.05])
    scale([.9,.5,1])
    cylinder(d=disk_1_width*1.5, h=4, center=true, $fn=faces_rough);
}

module disk_4_part_3() {
    translate([-(disk_4_width + disk_4_upper)/4,0,disk_4_height/2])
    difference() {
        cube([100, 50, disk_4_height],center=true);
        
        translate([-50,0,10])
        cube([5, 40, 20], center=true);
    }

    translate([-(disk_4_width + disk_4_upper)/4,0,disk_4_height-.01])
    disk_0();
}



module disk_4() {
    disk_4_part_1();
    disk_4_part_2();
    disk_4_part_3();
}

disk_4();
