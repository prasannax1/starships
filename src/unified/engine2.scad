use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>
use <engine0.scad>


module class_2_nacelle_flat() {
    intersection() {
        scale([class_2_nacelle_l*.75*2/class_2_nacelle_w,1,1])
        rotate(90)
        circle(d=class_2_nacelle_w, $fn=6);

        translate([-class_2_nacelle_l/2+.01,0,0])
        square(class_2_nacelle_l, center=true);
    }

    scale([class_2_nacelle_l*.25*2/class_2_nacelle_w,1,1])
    rotate(90)
    circle(d=class_2_nacelle_w, $fn=6);
}

module class_2_nacelle() {
    translate([class_0_secondary_l,0,0]) {
        translate([0,0,.01])
        mirror([0,0,1])
        linear_extrude(height=class_2_nacelle_h*.2, convexity=10, scale=[.9,.7])
        class_2_nacelle_flat();

        linear_extrude(height=class_2_nacelle_h*.7, convexity=10, scale=[.6,.5])
        class_2_nacelle_flat();

        linear_extrude(height=class_2_nacelle_h*.8, convexity=10, scale=[.64,1])
        translate([class_2_nacelle_l*.1,0,0])
        square([.25*class_2_nacelle_l, .4*class_2_nacelle_w], center=true);

        translate([-class_0_secondary_l,0,-class_2_nacelle_h*.2+.01])
        class_0_secondary();
    }
}

module class_2_neck() {
    scale([2,1,1])
    difference() {
        difference() {
            cylinder(h=20, d=class_2_secondary_w, center=true, $fn=faces_convex);

            rotate_extrude(angle=360, convexity=10, $fn=faces_concave)
            util_mirrored([0,1,0])
            util_repeat(4, [0, 2, 0])
            translate([class_2_secondary_w/2,0,0])
            square(1, center=true);
        }

        rotate([0,45,0])
        translate([-1.2*class_2_secondary_w*1.1/2,0,0])
        cube(class_2_secondary_w*1.1, center=true);
    }
}

module class_2_body_base() {
    scale([2,1,1]) {
        difference() {
            union() {
                rotate(-90)
                rotate_extrude(angle=180, convexity=10, $fn=faces_convex)
                class_2_body_flat();

                difference() {
                    sphere(d=class_2_secondary_w, $fn=faces_convex);

                    translate([-class_2_secondary_w/3,0,-class_2_secondary_w/4])
                    translate([0,0,-class_2_secondary_w*1.1*.5])
                    cube(class_2_secondary_w*1.1, center=true);
                }
            }
            
            translate([0,0,1.1*class_2_secondary_w/2+.01])
            cube(class_2_secondary_w*1.1, center=true);
        }
    }

    rotate([0,-90,0])
    rotate(180)
    linear_extrude(convexity=10, height=class_2_secondary_l-class_2_secondary_w*2)
    class_2_body_flat();


    difference() {
        rotate([0,-90,0])
        translate([0,0,(class_2_secondary_l-class_2_secondary_w*2)/2])
        cylinder(h=class_2_secondary_l-class_2_secondary_w*2, d= class_2_secondary_w, center=true, $fn=faces_convex);
        
        translate([-class_2_secondary_l/2+10, 0, class_2_secondary_l/2+.01])
        cube(class_2_secondary_l, center=true);
        
        translate([-class_2_secondary_l/2+10, 0, -class_2_secondary_l/2+.01-class_2_secondary_w/4])
        cube(class_2_secondary_l, center=true);
    }

    translate([-(class_2_secondary_l-class_2_secondary_w*2),0,0])
    scale([2,1,1])
    difference() {
        sphere(d=class_2_secondary_w, $fn=faces_convex);
        
        translate([0,0,.5*1.1*class_2_secondary_w+.01])
        cube(1.1*class_2_secondary_w, center=true);
    }
}

module class_2_body_plus() {
    class_2_body_base();

    translate([0,0,10-.01])
    class_2_neck();
    
    util_mirrored([0,1,0])
    translate([class_0_hangar_l/2-5,9,-6-class_2_secondary_w/8-1.8])
    mirror([0,0,1])
    class_0_hangars();
}

module class_2_body_minus() {
    translate([0-20,0,-class_2_secondary_w/2])
    scale([2,1,1])
    translate([-class_2_secondary_w/2,0,0])
    rotate([90,0,0])
    cylinder(d=class_2_secondary_w-12, h=class_2_secondary_w*1.1, center=true, $fn=faces_concave);

    translate([-class_2_secondary_w-20,0,-6])
    translate([-class_2_secondary_l/2, 0, -class_2_secondary_w/2])
    cube([class_2_secondary_l, class_2_secondary_w*1.1, class_2_secondary_w], center=true);
    
    translate([class_2_secondary_w,0,-15])
    scale([2.5,1,1])
    sphere(d=20, $fn=faces_concave);
    
    translate([-class_2_secondary_l*.75,0,-1.5])
    cube([20, 20, 7], center=true);
}



module class_2_body() {
    difference() {
        class_2_body_plus();
        class_2_body_minus();
    }

    translate([class_2_secondary_w-24,0,-15])
    rotate([0,90,0])
    cylinder(d=10, h=3, center=true, $fn=faces_rough);
    
    translate([-(class_2_secondary_l-class_2_secondary_w*2),0,0])
    scale([2,1,.33])
    difference() {
        sphere(d=class_2_secondary_w, $fn=faces_convex);
        
        translate([0,0,-.5*1.1*class_2_secondary_w-.01])
        cube(1.1*class_2_secondary_w, center=true);
        
        translate([.5*1.1*class_2_secondary_w,0,0])
        cube(1.1*class_2_secondary_w, center=true);
    }

    translate([-(class_2_secondary_l-class_2_secondary_w*2),0,0])
    scale([.8,.8,.33*.8])
    difference() {
        sphere(d=class_2_secondary_w, $fn=faces_convex);
        
        translate([0,0,-.5*1.1*class_2_secondary_w-.01])
        cube(1.1*class_2_secondary_w, center=true);
    }
}


module class_2_secondary() {
    class_2_body();

    theta=45;

    util_mirrored([0,1,0])
    translate([0,-class_2_secondary_w/2,0])
    rotate([theta,0,0]) {
        translate([-class_0_secondary_l,0,0])
        class_2_nacelle_bar();
        translate([-class_2_nacelle_l*.35-10, 0, class_2_secondary_w-3])
        rotate([-theta, 0, 0])
        class_2_nacelle();
    }
}


module class_2_nacelle_bar() {
    difference() {
        translate([-class_2_secondary_w*.75-15, 0, class_2_secondary_w/2-3])
        cube([class_2_secondary_w*1.5, 3, class_2_secondary_w], center=true);

        translate([-15, 0, class_2_secondary_w-3])
        rotate([90,0,0])
        cylinder(r= class_2_secondary_w, h=10, center=true, $fn=faces_concave);
    }

    translate([-15, 0, class_2_secondary_w-3])
    rotate([90,0,0])
    rotate(180)
    rotate_extrude(angle=90, convexity=10, $fn=faces_convex)
    translate([class_2_secondary_w,0,0])
    circle(d=3, $fn=faces_rough);
}

module class_2_body_flat() {
    difference() {
        circle(d=class_2_secondary_w, $fn=faces_convex);

        circle(d=class_2_secondary_w-6, $fn=faces_concave);
        
        translate([-.5*class_2_secondary_w*1.1, 0, 0])
        square(class_2_secondary_w*1.1, center=true);
    }
}

class_2_secondary();