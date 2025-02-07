use <../lib/util.scad>
include <common.scad>
use <disks.scad>

module disk_point_5_plus() {
    translate([0,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+4*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

    linear_extrude(convexity=10, height=2*disk_0_deck_h, scale=[1,(disk_0_upper_d/ (disk_0_upper_d+4*disk_0_deck_h))])
    translate([-disk_0_width/4,0,0])
    square([disk_0_width/2, disk_0_upper_d+4*disk_0_deck_h], center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_0_width/2, disk_0_upper_d/2 + disk_0_deck_h/2, disk_0_deck_h/2+.5])
    sphere(d=.8*disk_0_deck_h, $fn=faces_convex);
}

module disk_0_plus() {
    translate([0,0,disk_0_deck_h/2])
    cylinder(d1=disk_0_width, d2=(disk_0_width-2*disk_0_deck_h), h=disk_0_deck_h, center=true, $fn=faces_convex);

    disk_point_5_plus();
}

module disk_0_under() {
    difference() {
        translate([0,0,-disk_0_deck_h])
        cylinder(d2=(disk_0_upper_d+4*disk_0_deck_h), d1=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);
        
        translate([0,0,-2*disk_0_deck_h])
        cylinder(d2=disk_0_upper_d-2, d1=disk_0_upper_d, h=.5, center=true, $fn=faces_convex);
        
        util_repeat_rot(7, [0,0,45])
        translate([disk_0_upper_d/2+disk_0_deck_h,0,-disk_0_deck_h*.5]) porthole();
        
        util_repeat_rot(3, [0,0,90])
        translate([disk_0_upper_d/2,0,-disk_0_deck_h*1.5]) porthole();
    }
}

module disk_0_under_2() {
    difference() {
        translate([0,0,-disk_0_deck_h])
        cylinder(d2=disk_0_width, d1=(disk_0_width-4*disk_0_deck_h), h=disk_0_deck_h*2, center=true, $fn=faces_convex);
        
        translate([0,0,-2*disk_0_deck_h])
        cylinder(d2=disk_0_upper_d-2, d1=disk_0_upper_d, h=.5, center=true, $fn=faces_convex);
    }
}

module disk_point_5_minus() {
    translate([-disk_0_width/2,0,disk_0_deck_h])
    cube([.5, disk_0_upper_d-1, 2*disk_0_deck_h-1], center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_0_width/2-.4*disk_0_deck_h, disk_0_upper_d/2 + disk_0_deck_h/2, disk_0_deck_h/2+.5])
    sphere(d=.6*disk_0_deck_h, $fn=faces_convex);
    
    translate([disk_0_upper_d/2+disk_0_deck_h/4, 0, disk_0_deck_h*1.5])
    scale([1,2,1])
    window();
    
    util_mirrored([0,1,0])
    util_repeat(3, [-4,0,0])
    rotate(90)
    translate([disk_0_upper_d/2+disk_0_deck_h/2, 0, disk_0_deck_h*1.5])
    porthole();
}

module disk_0_minus() {
    translate([0,0,2*disk_0_deck_h])
    cylinder(d1=disk_0_upper_d-2, d2=disk_0_upper_d, h=.5, center=true, $fn=faces_convex);
    
    disk_point_5_minus();
    
    util_mirrored([0,1,0])
    util_repeat_rot(6, [0,0,22])
    translate([disk_0_width/2-disk_0_deck_h/2,0, disk_0_deck_h*.5])
    porthole();
}

module disk_0() {
    difference() {
        disk_0_plus();
        disk_0_minus();
    }
}


module disk_point_5() {
    difference() {
        disk_point_5_plus();
        disk_point_5_minus();
    }
}

disk_0();