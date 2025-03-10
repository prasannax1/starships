use <../lib/util.scad>
include <common.scad>
use <disks.scad>
use <engines.scad>
use <engine0.scad>

module class_1_nacelle() {
    difference() {
        class_1_nacelle_plus();
        class_1_nacelle_minus();
    }
}


module class_1_nacelle_plus() {
    intersection() {
        scale([class_1_nacelle_l*2/class_1_nacelle_w,1,1]) {
            util_mirrored([0,0,1])
            translate([0,0,class_1_nacelle_w/4])
            sphere(d=class_1_nacelle_w, $fn=faces_convex);

            cylinder(d=class_1_nacelle_w,h=class_1_nacelle_w/2,center=true, $fn=faces_convex);
        }

        translate([-class_1_nacelle_l/4,0,class_1_nacelle_w*.75])
        rotate([90,0,0])
        cylinder(d=class_1_nacelle_l, h=class_1_nacelle_w*2, center=true, $fn=6);
    }

    translate([class_1_nacelle_l/5.5,0,0])
    scale([2,1,1]) 
    rotate([0,15,0])
    {
        util_mirrored([0,0,1])
        translate([0,0,class_1_nacelle_w/4])
        sphere(d=class_1_nacelle_w*.9, $fn=faces_convex);

        cylinder(d=class_1_nacelle_w*.9,h=class_1_nacelle_w/2,center=true, $fn=faces_convex);
    }
    
    util_mirrored([0,1,0])
    translate([-class_1_nacelle_l*.6,0,class_1_nacelle_w/4])
    rotate([45,0,0]) {
        translate([0,0,class_1_nacelle_w/4])
        cube([15,1,class_1_nacelle_w/2], center=true);
        
        translate([0,0,class_1_nacelle_w/2])
        rotate([0,90,0])
        cylinder(h=15, d=1, center=true, $fn=8);
    }

}

module class_1_nacelle_minus() {
    util_mirrored([0,1,0])
    translate([0,class_1_nacelle_w/2,0])
    rotate([0,90,0])
    cylinder(h=2*class_1_nacelle_l, d=1, center=true, $fn=4);
}


module class_1_neck_element_1() {
    rotate([90,0,0])
    cylinder(d=class_1_neck_w_2, h=class_1_neck_w, center=true, $fn=faces_rough);
}

module class_1_neck_element_2() {
    cylinder(h=class_1_neck_w_2, d=class_1_neck_w, center=true, $fn=faces_rough);
}


module class_1_assembly() {
    translate([-disk_1_width/4,0,0])
    class_0_secondary();
    
    translate([-disk_1_width*.35,0,0])
    class_1_neck();

    translate([-disk_1_width/2,0,-disk_1_height*1.25])
    class_1_nacelle();
}


module class_1_neck() {
    difference() {
        hull() {
            translate([class_1_neck_w_2*7.5,0,0])
            class_1_neck_element_2();

            translate([-0,0,0])
            class_1_neck_element_2();

            translate([class_1_neck_w_2*7.5,0,-disk_1_height])
            class_1_neck_element_2();

            translate([-disk_1_height*4.2,0,-disk_1_height])
            class_1_neck_element_2();
        }
        
        util_mirrored([0,1,0])
        util_repeat(4, [0,0,-3])
        translate([-0, class_1_neck_w/2, -1.5]) rotate(90) window();
        
        util_mirrored([0,1,0])
        util_repeat(7, [3,0,0])
        translate([-3, class_1_neck_w/2, -1.5]) rotate(90) porthole();
        
        util_mirrored([0,1,0])
        util_repeat(8, [3,0,0])
        translate([-18, class_1_neck_w/2, -7.5]) rotate(90) porthole();
    }
}

module class_1_sec_plus() {
    rotate([0,90,0])
    rotate_extrude(angle=360, convexity=10, $fn=faces_concave)
        rotate(-90) {
        intersection() {
            scale([6,1,1]) {
                circle(d=class_1_secondary_w, $fn=faces_convex);

//                rotate(-7.5)
//                translate([class_1_secondary_l/2,0,0])
//                square([class_1_secondary_l, class_1_secondary_w], center=true);
            }

            translate([class_1_secondary_l*.5*.66,class_1_secondary_l*.33,0])
            square(class_1_secondary_l*.66, center=true);
        }
        
        intersection() {
            scale([1.8,1,1])
            circle(d=class_1_secondary_w*1, $fn=faces_concave);
            translate([class_1_secondary_l*.22,class_1_secondary_l*.4,0])
            square(class_1_secondary_l*.8, center=true);
        }

        intersection() {
            translate([class_1_secondary_l*.63,0,0])
            circle(d=.7*class_1_secondary_w, $fn=faces_convex);

            translate([class_1_secondary_l*.63, class_1_secondary_w/2,0])
            square(class_1_secondary_w, center=true);
        }
    }

    rotate([0,90,0])
    translate([0,0,class_1_secondary_w*.35])
    cylinder(d1=class_1_secondary_w, d2=class_1_secondary_w*.64, h=class_1_secondary_w*.7, center=true, $fn=faces_convex);

}

module class_1_sec_body() {
    difference() {
        class_1_sec_plus();
        class_1_sec_minus();
    }
    
    translate([-class_1_secondary_l*.63,0,0])
    spherical_hangar_door(class_1_secondary_w*.7-2, class_1_secondary_w*.35-1);
}


module class_1_sec_minus() {
    translate([class_1_secondary_w*.7,0,0])
    scale([.25,1,1])
    sphere(d=class_1_secondary_w/2, $fn=faces_concave);
    
    translate([-class_1_secondary_l*.63-class_1_secondary_w*.7/2,0,0])
    intersection() {
        rotate([90,0,0])
        cylinder(d=.7*class_1_secondary_w, h=class_1_secondary_w, $fn=faces_concave, center=true);

        translate([0,0,class_1_secondary_w/2+.5])
        cube(class_1_secondary_w, center=true);
    }
    
    translate([-class_1_secondary_l*.63-class_1_secondary_w*.7/2,0,-class_1_secondary_w/2-.5])
    scale([2.5,1,1])
    rotate([90,0,0])
    cylinder(d=class_1_secondary_w, h=class_1_secondary_w, $fn=faces_concave, center=true);
    
    util_mirrored([0,1,0])
    util_mirrored([0,0,1])
    translate([0,class_1_secondary_w/2, 1.5])
    rotate(90)
    porthole();
    
    util_mirrored([0,1,0])
    translate([-6, class_1_secondary_w/2, -1.5])
    rotate(90)
    window();

}

module class_1_secondary() {
    translate([disk_1_height-class_1_neck_w/2-5,0,disk_1_height+class_1_secondary_w/2-class_1_neck_w/2-1.5])
    class_1_neck();
    translate([class_1_neck_w_2*2,0,class_1_neck_w_2/2])
    class_1_sec_body();

    theta=45;

    translate([-4,0,0])
    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-disk_1_width*.5, 0, disk_1_width/2])
        rotate([-theta,0,0])
        class_1_nacelle();

        hull() {
            translate([0,0,0])
            scale([1,1,1])
            sphere(d=3, $fn=12);

            translate([-disk_1_width*.55, 0, disk_1_width/2])
            sphere(d=3);
            
            translate([-disk_1_width*.75, 0, disk_1_width/2])
            sphere(d=3);

            translate([-disk_1_width*.75, 0, disk_1_width/2-class_1_nacelle_w*1.5])
            sphere(d=3);
        }
    }
}

class_1_secondary();
