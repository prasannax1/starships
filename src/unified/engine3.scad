use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <disk0.scad>;
use <engines.scad>
use <engine0.scad>

module class_3_nacelle_base() {
    rotate_extrude(angle=90, convexity=2, $fn=faces_convex)
    intersection() {
        scale([class_3_nacelle_h*3/class_3_nacelle_w,1,1]) {
            util_mirrored([0,1,0])
            translate([0, class_3_nacelle_w/6,0])
            circle(r=class_3_nacelle_w/3, $fn=faces_convex);

            square([class_3_nacelle_w*2/3, class_3_nacelle_w/3], center=true);
        }

        translate([class_3_nacelle_l/2,0,0])
        square(class_3_nacelle_l, center=true);
    }
}


module class_3_nacelle() {
    translate([-.01,0,-.01])
    scale([2,1,1])
    rotate([90,0,0]) class_3_nacelle_base();

    translate([.01,0,-.01])
    scale([(class_3_nacelle_l-class_3_nacelle_h*2)/class_3_nacelle_h,1,1])
    rotate(180)
    rotate([90,0,0])
    class_3_nacelle_base();

    translate([-.01,0, .01])
    scale([2,1,.25])
    rotate([-90,0,0]) class_3_nacelle_base();

    translate([.01,0,.01])
    scale([(class_3_nacelle_l-class_3_nacelle_h*2)/class_3_nacelle_h,1,.25])
    rotate(180)
    rotate([-90,0,0])
    class_3_nacelle_base();
}

module class_3_secondary_plus() {
    scale([1.2*class_3_secondary_l/class_3_secondary_w, 1, class_3_secondary_h/class_3_secondary_w])
    intersection() {
        sphere(d=class_3_secondary_w, $fn=faces_convex);
        
        translate([-.6*class_3_secondary_w+.01,0,-.6*class_3_secondary_w + 30])
        cube(1.2*class_3_secondary_w, center=true);
        
    }

    scale([2.5, 1, class_3_secondary_h/class_3_secondary_w])
    intersection() {
        sphere(d=class_3_secondary_w, $fn=faces_convex);
        
        translate([-.2*class_3_secondary_w,0,-.6*class_3_secondary_w+.01])
        cube(1.2*class_3_secondary_w, center=true);
        
    }
}



module class_3_secondary_minus() {
    translate([class_3_secondary_w*1,0,0])
    scale([.5,1,1])
    sphere(d=class_3_secondary_w/2, $fn=faces_concave);
    
    translate([-.6*class_3_secondary_l+75, 0, -.5*class_3_secondary_h-1.5])
    scale([2,1,1])
    rotate([90,0,0])
    cylinder(d=class_3_secondary_h, h=class_3_secondary_w*1.2, center=true, $fn=faces_concave);

    translate([-.6*class_3_secondary_l+75, 0, -1.5])
    translate([-.6*class_3_secondary_w, 0, -.6*class_3_secondary_w])
    cube(class_3_secondary_w*1.2,center=true);
    
    translate([-.6*class_3_secondary_l,0,0])
    intersection() {
    rotate([90,0,0])
    cylinder(d=class_3_secondary_h, h=class_3_secondary_w*1.2, center=true, $fn=6);
        
        translate([0,0,1.5])
        translate([0,0,.625*class_3_secondary_w])
        cube(1.25*class_3_secondary_w, center=true);
    }
    
    translate([-class_3_secondary_l/4,0,-1.5])
    rotate([0,-90,0])
    translate([0,0,class_3_secondary_l/4])
    intersection() {
        cylinder(d=disk_0_width*1.5, h=class_3_secondary_l/2, center=true, $fn=faces_concave);

        translate([-class_3_secondary_l/2,0,0])
        cube(class_3_secondary_l, center=true);
    }
}

module class_3_secondary_base() {
    difference() {
        class_3_secondary_plus();
        class_3_secondary_minus();
    }
    
    translate([class_3_secondary_w*1,0,0+.01])
    translate([-class_3_secondary_w/8,0,-2])
    cube([class_3_secondary_w/4, class_3_secondary_w/2+2, 4], center=true);
    
    translate([-.6*class_3_secondary_l+class_3_secondary_w/2,0,-.01])
    spherical_hangar_door(.5*class_3_secondary_w, .25*class_3_secondary_h);
    
    translate([-.6*class_3_secondary_l + 15,0,1])
    disk_0_under();
}


module class_3_nacelle_bar_flat() {
    scale([1.8,1,1])
    circle(d=6, $fn=faces_rough);

    translate([100,0,0])
    square([200, 2], center=true);
}

module class_3_nacelle_bar_plus() {
    translate([-500,0,-410+75])
    intersection() {
        rotate([90,0,0] ) {
            rotate_extrude(angle=90, convexity=3, $fn=faces_convex)
            translate([500,0,0]) class_3_nacelle_bar_flat();

            translate([925,925,0])
            rotate(180)
            rotate_extrude(angle=90, convexity=3, $fn=faces_convex)
            translate([600,0,0]) class_3_nacelle_bar_flat();
        }

        translate([500,0,410])
        cube([1000,1000,150], center=true);
    }
}

module class_3_nacelle_bar_minus() {
    util_repeat(11, [-15,0,10])
    translate([-50,0,10])
    cube([100,100,5], center=true);
}

module class_3_nacelle_bar() {
    difference() {
        class_3_nacelle_bar_plus();
        class_3_nacelle_bar_minus();
    }
}

module class_3_secondary(theta) {
    class_3_secondary_base();

    translate([0,0,5+1.8])
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-144,0,0])
        scale([.35,1,1])
        class_3_nacelle_bar();

        translate([-100,0,130])
        rotate([-theta,0,0])
        class_3_nacelle();
    }
    
    translate([-25,0,30-.01-2.5]) disk_0();
}

class_3_secondary(75);