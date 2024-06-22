use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>
use <engine3.scad>
use <disk0.scad>

r_base=100;
d_disk=disk_4_upper*.85;

module class_4_body_base() {
    translate([0,0,-10+.01])
    intersection() {
        scale([class_4_tail_l*1.1/r_base, (0.5*class_4_body_width/r_base), (1/.866)*class_4_body_h/r_base])
        rotate([0,90,0])
        rotate(90)
        rotate_extrude(angle=360, convexity=3, $fn=6)
        difference() {
            circle(r=r_base, $fn=faces_concave);
            translate([-r_base*1.1,0,0])
            square(r_base*2.2, center=true);
        }

        union() {
            translate([-class_4_tail_l/2,0,-    class_4_body_h*1.2/2])
            cube([class_4_tail_l+.5, class_4_tail_l, class_4_body_h*1.2+.5], center=true);
            
            translate([0,0,-class_4_body_h*.6])
            cylinder(d2=d_disk, h=class_4_body_h*1.2, d1=d_disk-2*class_4_body_h*1.2, center=true, $fn=faces_concave);
        }
    }

    translate([0,0,-class_4_body_h*.25-10])
    cylinder(d2=d_disk, h=class_4_body_h*.5, d1=d_disk-class_4_body_h, center=true, $fn=faces_concave);
    
    class_4_secondary_bar();
    
    translate([-disk_4_upper/2-disk_2_width/2, 0, -10])
    cylinder(h=20.5, d1=disk_1_width*.75+50, d2=disk_1_width*.75, $fn=faces_convex, center=true);
}

module class_4_secondary_bar() {
    translate([-class_4_tail_l+class_4_nacelle_bar_l/2+10, 0, -class_4_nacelle_bar_w/2-9])
    difference() {
        union() {
            cube([class_4_nacelle_bar_l, class_4_nacelle_disp*2, class_4_nacelle_bar_w], center=true);

            util_mirrored([1,0,0])
            translate([class_4_nacelle_bar_l/2,0,0])
            rotate([90,0,0])
            cylinder(d=class_4_nacelle_bar_w, h=class_4_nacelle_disp*2, center=true, $fn=faces_rough);
        }
    }
}


        
module class_4_body_minus() {
    translate([-class_4_tail_l, 0, -class_4_body_h-10])
    scale([3.6,1,1])
    rotate([90,0,0])
    cylinder(r=class_4_body_h, h=class_4_body_width, center=true, $fn=6);
    
    translate([-class_4_tail_l+disk_1_width,0,0]) {
        cylinder(d=disk_1_width-1, h=100, $fn=faces_concave, center=true);

        translate([-disk_1_width,0,0])
        cube([2*disk_1_width, disk_1_width-1, 100], center=true);
    }
}

module class_4_body() {
    difference() {
        class_4_body_base();
        class_4_body_minus();
    }
    
    translate([0,0,-10-.01])
    disk_0();
    
    translate([-500,0,-10-.01])
    disk_0();
}

module class_4_secondary(nacelles=false) {
    class_4_body();
    
    if (nacelles) {
        util_mirrored([0,1,0])
        translate([-class_4_tail_l+class_3_nacelle_l*.4, class_4_nacelle_disp, -10-10]) class_3_nacelle();
    }
}

class_4_secondary(true);