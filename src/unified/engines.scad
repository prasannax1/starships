use <../lib/util.scad>
include <common.scad>
use <disks.scad>

module class_0_nacelle() {
    intersection() {
        translate([class_0_nacelles_l/4,0,0])
        scale([2*class_0_nacelles_l/class_0_nacelles_w,1,1])
        sphere(d=class_0_nacelles_w, $fn=faces_convex);

        translate([-class_0_nacelles_l/8,0,0])
        cube(class_0_nacelles_l, center=true);
    }

    translate([class_0_nacelles_l/2-class_0_nacelles_l/8,0,0])
    sphere(d=class_0_nacelles_w*.8, $fn=faces_convex);
}

module class_0_attack_engine() {
    class_0_secondary();
    translate([-class_0_nacelles_l*.75,0,0])
    class_0_double_nacelle();
}

module spherical_hangar_door(d1, h1) {
    rotate_extrude(angle=360, convexity=10, $fn=faces_rough)
    difference() {
        scale([1, 2*h1/d1, 1])
        circle(d=d1, $fn=faces_concave);

        translate([-(d1+h1)/2,0,0])
        square(d1+h1, center=true);

        translate([0, -(d1+h1)/2-.05,0])
        square(d1+h1, center=true);
    }
}


module class_0_double_nacelle() {
    difference() {
        union() {
            util_mirrored([0,1,0])
            translate([0,class_0_nacelles_w/2,0])
            class_0_nacelle();

            intersection() {
                translate([class_0_nacelles_l/4,0,0])
                scale([2*class_0_nacelles_l/class_0_nacelles_w,1,1])
                rotate([90,0,0])
                cylinder(d=class_0_nacelles_w, h=class_0_nacelles_w, $fn=faces_convex, center=true);

                translate([-class_0_nacelles_l/8,0,0])
                cube(class_0_nacelles_l, center=true);
            }
        }
        
        translate([-class_0_nacelles_l*5/8,0,0])
        rotate([90,0,0])
        cylinder(d=1,h=class_0_nacelles_w, center=true, $fn=faces_rough);
    }
}

module class_0_hangars() {
    difference() {
        union() {
            translate([0,0,disk_0_deck_h])
            cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

            linear_extrude(convexity=10, height=2*disk_0_deck_h, scale=[1,(disk_0_upper_d/ (disk_0_upper_d+2*disk_0_deck_h))])
            translate([-class_0_hangar_l/2,0,0])
            square([class_0_hangar_l, disk_0_upper_d+2*disk_0_deck_h], center=true);

            translate([-class_0_hangar_l,0,disk_0_deck_h])
            cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

            scale([1,1,.25]) {
                sphere(d=disk_0_upper_d+2*disk_0_deck_h, $fn=faces_convex);

                rotate([0,-90,0])
                translate([0,0,class_0_hangar_l/2])
                cylinder(d=disk_0_upper_d+2*disk_0_deck_h, h=class_0_hangar_l, center=true, $fn=faces_convex);

                translate([-class_0_hangar_l,0,0])
                sphere(d=disk_0_upper_d+2*disk_0_deck_h, $fn=faces_convex);
            }
        }

        translate([disk_0_upper_d+.1,0,disk_0_deck_h])
        cube([2*disk_0_upper_d, 2*disk_0_upper_d, 4], center=true);

        translate([-disk_0_upper_d-class_0_hangar_l-.1,0,disk_0_deck_h])
        cube([2*disk_0_upper_d, 2*disk_0_upper_d, 4], center=true);
    }

    translate([0,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h-1), d2=disk_0_upper_d-.5, h=disk_0_deck_h*2-1, center=true, $fn=faces_rough);

    translate([-class_0_hangar_l,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+2*disk_0_deck_h-1), d2=disk_0_upper_d-.5, h=disk_0_deck_h*2-1, center=true, $fn=faces_rough);
}

module class_0_secondary() {
    difference(){
        intersection() {
            rotate([0,90,0])
            rotate(90)
            cylinder(d=class_0_secondary_w, h=class_0_secondary_l, $fn=6, center=true);

            translate([0,0,-class_0_secondary_l*.75+.01])
            cube(class_0_secondary_l*1.5, center=true);
            
            translate([class_0_secondary_l/2,0,0])
            rotate([0,45,0])
            translate([-class_0_secondary_l*.75,0,-class_0_secondary_l*.75])
            cube(class_0_secondary_l*1.5, center=true);
        }
        
        translate([class_0_secondary_l/2,0,0])
        translate([-class_0_secondary_w/4,0,0])
        intersection() {
            rotate([0,90,0])
            rotate(90)
            cylinder(d=class_0_secondary_w-1, h=class_0_secondary_w/2, center=true, $fn=6);

            translate([0,0,-class_0_secondary_w*.75-.5])
            cube(class_0_secondary_w*1.5, center=true);
        }
        
        translate([-class_0_secondary_l/2,0,-class_0_secondary_w/2-.5])
        scale([2.5,1,1])
        rotate([90,0,0])
        cylinder(d=class_0_secondary_w, h=class_0_secondary_w*2, center=true, $fn=6);
    }

    translate([class_0_secondary_l/2-class_0_secondary_w/2,0,0])
    intersection() {
        rotate(90)
        sphere(d=class_0_secondary_w-2, $fn=6);
        
        translate([0,0,-class_0_secondary_w/2-.05])
        cube(class_0_secondary_w, center=true);
    }
}


module class_0_habitat() {
    difference() {
        intersection() {
            scale([5,1,1])
            sphere(d=disk_0_upper_d, $fn=faces_convex);
            
            cube(disk_0_width, center=true);
        }
        
        util_mirrored([0,1,0])
        util_mirrored([0,0,1])
        util_mirrored([1,0,0]) {
            util_repeat(2, [-6,0,0])
            translate([0, disk_0_upper_d/2-1, 1.5])
            rotate(90)
            porthole();
            
            util_repeat(1, [-6,0,0])
            translate([0, disk_0_upper_d/2-2.5, 4.5])
            rotate(90)
            porthole();
        }
    }
    
    difference() {
        rotate([0,90,0])
        cylinder(d=disk_0_upper_d*.7, h=disk_0_width+1, center=true, $fn=faces_convex);
        
        util_mirrored([1,0,0]) {
            translate([disk_0_width/2+.75, 0, 1.5])
            window();
            
            util_mirrored([0,1,0])
            translate([disk_0_width/2+.75, .75, -1.5])
            porthole();
        }
    }
    
    translate([disk_1_height*.75,0,disk_1_height*.5/2])
    cylinder(d1=disk_0_upper_d*.75, d2=disk_0_upper_d*.3, h=disk_1_height*.5, center=true, $fn=faces_convex);
    
        translate([-disk_1_height*.75,0,disk_1_height*.25])
    cylinder(d1=disk_0_upper_d*.75, d2=disk_0_upper_d*.3, h=disk_1_height*.5, center=true, $fn=faces_convex);
}

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
    rotate_extrude(angle=360, convexity=10, $fn=faces_convex)
        rotate(-90) {
        intersection() {
            scale([2,1,1]) {
                circle(d=class_1_secondary_w, $fn=faces_convex);

                rotate(-7.1)
                translate([class_1_secondary_l/2,0,0])
                square([class_1_secondary_l, class_1_secondary_w], center=true);
            }

            translate([class_1_secondary_l*.25,class_1_secondary_l*.4,0])
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
    scale([3.2,1,1])
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

module class_2_sec_body() {
    translate([0,0,.01])
    rotate([0,90,0])
    rotate(-90)
    rotate_extrude(angle=180, convexity=10, $fn=faces_convex)
    difference() {
        union() {
            circle(d=class_2_secondary_w, $fn=faces_convex);

            rotate(12.5)
            translate([0,class_2_secondary_l*.8/4,0])
            square([class_2_secondary_w, class_2_secondary_l*.8/2], center=true);
        }

        translate([-class_2_secondary_l/2,class_2_secondary_l/4,0])
        square(class_2_secondary_l, center=true);
    }

    difference() {
        scale([class_2_secondary_l*1.2/class_2_secondary_w, 1, 12*disk_2_deck/class_2_secondary_w])
        intersection() {
            sphere(d=class_2_secondary_w, $fn=faces_convex);
            
            translate([0,0,class_2_secondary_w*.6-.01])
            cube(class_2_secondary_w*1.2, center=true);
        }

        translate([2*disk_2_deck+.01,0,0])
        rotate([0,-45,0])
        translate([disk_2_width/2,0,0])
        cube(disk_2_width, center=true);
        
        translate([-class_2_secondary_l*.6,0,class_2_secondary_w/2+1.5])
        cube(class_2_secondary_w, center=true);
    }

    difference() {
        scale([class_2_secondary_l*1.2/class_2_secondary_w, 1, 1])
        intersection() {
            sphere(d=class_2_secondary_w, $fn=faces_convex);
            translate([-class_2_secondary_w*.6-.01,0,-class_2_secondary_w*.6-.01])
            cube(class_2_secondary_w*1.2, center=true);
        }
            
        translate([-class_2_secondary_w*.75,0,-class_2_secondary_w/2-1.5])
        scale([1.5,1,1])
        rotate([90,0,0])
        cylinder(d=class_2_secondary_w, h=class_2_secondary_w*1.2, center=true, $fn=faces_concave);
        
        translate([-class_2_secondary_l/4-class_2_secondary_w*.75,0,-class_2_secondary_w/2-1.5])
        cube([class_2_secondary_l/2, class_2_secondary_w*1.2, class_2_secondary_w], center=true);
    }

    translate([-class_2_secondary_l*.74+class_2_secondary_w,0,0])
    spherical_hangar_door(class_2_secondary_w*.6, class_2_secondary_w*.3*.6);
    
    translate([-class_2_secondary_l/2-7.5,0,.05])
    disk_0_under();
}


module class_2_secondary_old() {
    class_2_sec_body();
    theta=72;

    util_mirrored([0,1,0])
    rotate([theta,0,0]) {
        translate([-class_2_nacelle_l/2,0,disk_2_width/2-class_2_nacelle_w*1.5])
        rotate([-theta,0,0])
        class_2_nacelle();

        hull() {
            sphere(d=5);

            translate([-class_2_secondary_l*.7+class_2_secondary_w*1.3,0,0])
            sphere(d=5);

            translate([-class_2_nacelle_l/2+class_0_secondary_l/2,0,disk_2_width/2-class_2_nacelle_w*1.5])
            sphere(d=2.5);

            translate([-class_2_nacelle_l/2-class_0_secondary_l/2,0,disk_2_width/2-class_2_nacelle_w*1.5])
            sphere(d=2.5);
        }
    }
}

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
        cylinder(d=disk_0_width*1.1, h=class_3_secondary_l/2, center=true, $fn=faces_concave);

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

module class_3_secondary() {
    class_3_secondary_base();
    theta = 75;

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

module class_3_nacelle_old() {
    translate([class_3_nacelle_l/2,0,class_3_nacelle_h/2-.01])
    disk_0();
    
    difference() {
        union() {
            translate([class_3_nacelle_l/2-.01,0,0])
            rotate(-90)
            rotate_extrude(angle=180, convexity=10, $fn=faces_convex) {
                translate([class_3_nacelle_w/2-class_3_nacelle_h/2,0,0])
                circle(d=class_3_nacelle_h, $fn=faces_rough);

                translate([class_3_nacelle_w/4-class_3_nacelle_h/4,0,0])
                square([class_3_nacelle_w/2-class_3_nacelle_h/2, class_3_nacelle_h], center=true);
            }

            util_mirrored([0,1,0])
            translate([0, class_3_nacelle_w/2-class_3_nacelle_h/2, 0])
            rotate([0,90,0])
            cylinder(d=class_3_nacelle_h, h=class_3_nacelle_l, center=true, $fn=faces_rough);

            util_mirrored([0,1,0])
            translate([-class_3_nacelle_l/2, class_3_nacelle_w/2-class_3_nacelle_h/2, 0])
            sphere(d=class_3_nacelle_h, $fn=faces_rough);

            translate([-class_3_nacelle_l/2,0,0])
            rotate([90,0,0])
            cylinder(d=class_3_nacelle_h, h=class_3_nacelle_w-class_3_nacelle_h, center=true, $fn=faces_rough);

            cube([class_3_nacelle_l, class_3_nacelle_w-class_3_nacelle_h, class_3_nacelle_h], center=true);
        }

        util_mirrored([0,1,0])
        translate([0,class_3_nacelle_w/2,0])
        rotate([0,90,0])
        cylinder(d=class_3_nacelle_h/8, $fn=faces_rough, h=class_3_nacelle_l, center=true);
    }
}

module class_4_nacelle_flat() {
    intersection() {
        scale([1,2*class_4_nacelle_l/class_4_nacelle_w,1])
        circle(d=class_4_nacelle_w, $fn=faces_concave);

        translate([class_4_nacelle_l*.75,class_4_nacelle_l*.75,0])
        square(1.5*class_4_nacelle_l, center=true);
    }
}

module class_4_nacelle_plus() {
    translate([0,2,-.01])
    intersection() {
        translate([0,class_4_nacelle_w*.1,class_4_nacelle_w*.1])
        rotate([0,-90,0])
        intersection() {
            rotate_extrude(angle=360, convexity=10, $fn=faces_convex)
            class_4_nacelle_flat();

            rotate_extrude(angle=360, convexity=10, $fn=4)
            scale([1.2,1,1])
            class_4_nacelle_flat();
        }

        translate([-class_4_nacelle_l/2,class_4_nacelle_l*.75,class_4_nacelle_l*.75])
        cube(1.5*class_4_nacelle_l, center=true);
    }
}

module class_4_nacelle_minus() {
    translate([-class_4_nacelle_l*.9,0,0])
    rotate([0,-45,0])
    translate([-class_4_nacelle_w*5/2,0,0])
    cube(class_4_nacelle_w*5, center=true);
}

module class_4_nacelle() {
    difference() {
        class_4_nacelle_plus();
        class_4_nacelle_minus();
    }
}



module class_4_secondary_plus() {
    rotate([90,0,0])
    cylinder(d=class_4_nacelle_w*1, h=class_4_nacelle_w*.6, center=true, $fn=faces_convex);

    intersection() {
        rotate([0,-45,0])
        translate([class_4_nacelle_l/2,0,0])
        cube([class_4_nacelle_l, .6*class_4_nacelle_w, class_4_nacelle_w*1],center=true);

        translate([0,0,class_4_nacelle_w*.4])
        translate([0,0,-class_4_nacelle_l/2])
        cube(class_4_nacelle_l, center=true);
    }

    sphere(d=class_4_nacelle_w, $fn=faces_convex);

    util_mirrored([0,1,0]) class_4_nacelle();

    difference() {
        translate([-class_4_nacelle_l*.5,0,.01])
        mirror([0,0,1])
        linear_extrude(height=class_4_nacelle_w*.32, convexity=10, scale=[.88,1])
        translate([-class_4_nacelle_l*.4*.5,0,0])
        square([class_4_nacelle_l*.4, class_4_nacelle_w*.6], center=true);
        
        
        translate([-class_4_nacelle_l*.9,0,-class_4_nacelle_w*.2+5])
        cube([200,50,25], center=true);
    }
    
    translate([-class_4_nacelle_l*.5,0,.01])
    rotate([90,0,0])
    cylinder(r=class_4_nacelle_w*.32, h=class_4_nacelle_w*.6, $fn=faces_convex, center=true);
    
    translate([-class_4_nacelle_l*.25,0,0])
    cube([class_4_nacelle_l*.5, class_4_nacelle_w*.6, 20], center=true);
}

module class_4_secondary_minus() {
    translate([class_4_nacelle_w*.75,0,0])
    rotate([0,90,0])
    cylinder(d1=15, d2=45, center=true, $fn=faces_concave, h=class_4_nacelle_w*.5);
    
    util_mirrored([0,1,0])
    util_repeat(5, [5/3,0,-10/3])
    translate([-class_4_nacelle_l/2-class_4_nacelle_w/2, class_4_nacelle_w*.3, -20/3])
    cube([class_4_nacelle_l, 1,1], center=true);
}

module class_4_secondary() {
    difference() {
        class_4_secondary_plus();
        class_4_secondary_minus();
    }
    
    translate([-class_4_nacelle_l+175,0,-2])
    cube([100, 10, 6], center=true);
}

module class_4_body_flat() {
    difference() {
        class_4_body_flat_plus();
        class_4_body_flat_minus();
    }
}

module class_4_body_flat_plus() {
            util_mirrored([0,1,0])
            translate([class_4_body_height-class_4_body_curve, class_4_body_w/2-class_4_body_curve, 0])
            circle(r=class_4_body_curve, $fn=faces_convex);

            translate([(class_4_body_height-class_4_body_curve)/2,0,0])
            square([class_4_body_height-class_4_body_curve, class_4_body_w], center=true);

            translate([class_4_body_height-class_4_body_curve,0,0])
            square([2*class_4_body_curve, class_4_body_w-2*class_4_body_curve],center=true);
}

module class_4_body_flat_minus() {
            util_mirrored([0,1,0])
            translate([class_4_body_height-class_4_body_curve, class_4_body_w/2-class_4_body_curve, 0])
            circle(r=class_4_body_curve-class_4_body_wall*.5, $fn=6);

            translate([(class_4_body_height+.5*class_4_body_wall-class_4_body_curve)/2,0,0])
            square([class_4_body_height-class_4_body_curve-class_4_body_wall, class_4_body_w-1.5*class_4_body_wall], center=true);

            translate([class_4_body_height-class_4_body_curve,0,0])
            square([2*class_4_body_curve-1.5*class_4_body_wall, class_4_body_w-2*class_4_body_curve],center=true);
}

module class_4_body_base() {
    intersection() {
        union() {
            rotate([-90,0,0])
            rotate_extrude(angle=180, convexity=10, $fn=faces_concave) class_4_body_flat();
            
            util_mirrored([1,0,0])
            mirror([0,0,1])
            linear_extrude(height=class_4_body_wall, convexity=10)
            class_4_body_flat_plus();
        }
        
        union() {
            translate([0,0,-1.25*class_4_body_height-class_4_body_upper_curve])
            cube([2.5*class_4_body_height, class_4_body_w, 2.5*class_4_body_height], center=true);

            util_mirrored([0,1,0])
            translate([0, class_4_body_w/2-class_4_body_upper_curve, -class_4_body_upper_curve])
            rotate([0,90,0])
            cylinder(r=class_4_body_upper_curve, h=2.5*class_4_body_height, $fn=faces_rough, center=true);

            translate([0,0,-class_4_body_upper_curve])
            cube([2.5*class_4_body_height, class_4_body_w-2*class_4_body_upper_curve, 2*class_4_body_upper_curve], center=true);
        }
    }
}

module class_4_body_plus() {
    translate([-class_4_body_height+.01,0,disk_4_height]) {
        intersection() {
            scale([1.5,1,1])
            class_4_body_base();

            translate([class_4_body_height/2,0,0])
            cube([class_4_body_height+.02, class_4_body_l, class_4_body_l], center=true);
        }

        scale([(class_4_body_l-class_4_body_height)/class_4_body_height,1,1])
        difference() {
            intersection() {
                class_4_body_base();

                translate([-1.25*class_4_body_w + .1,0,0])
                cube(2.5*class_4_body_w, center=true);
            }

            translate([-class_4_body_height*.64,0,-class_4_body_hangar*.95])
            translate([-class_4_body_hangar,0,0])
            rotate([90,0,0])
            cylinder(r=class_4_body_hangar, h=1.5*class_4_body_w, center=true, $fn=faces_concave);
        }

        translate([-class_4_body_l*.7,0,0]) {
            util_mirrored([1,0,0])
            translate([75,0,0])
            rotate([90,0,0])
            cylinder(d=20, h=class_4_nacelle_sep, center=true, $fn=faces_rough);
            
            translate([0,0,.05])
            cube([150, class_4_body_w,20], center=true);
            
            util_mirrored([0,1,0])
            translate([0,class_4_body_w/2,0])
            rotate([0,90,0])
            cylinder(h=150,d=20, center=true, $fn=faces_rough);
            
            translate([0,0,.05])
            cube([150, class_4_nacelle_sep, 20], center=true);
            
            util_mirrored([0,1,0])
            translate([class_3_nacelle_l/4,class_4_nacelle_sep/2,0-class_3_nacelle_h/2+15.6])
            class_3_nacelle();
        }
    }
    
    intersection() {
        translate([-class_4_body_l/2, 0, -class_4_body_w/2- class_4_hangar_h/2])
        cube([class_4_body_l, class_4_body_w, class_4_body_w], center=true);

        union() {
            translate([-class_4_body_height,0, disk_4_height])
            scale([1.5,1,1])
            rotate([90,0,0])
            cylinder(r=class_4_body_height, h=class_4_body_w-2*class_4_body_curve, center=true);

            translate([-class_4_body_height,0, disk_4_height])
            scale([.905*(class_4_body_l-class_4_body_height)/class_4_body_height,1,1])
            intersection() {
            rotate([90,0,0])
            cylinder(r=class_4_body_height, h=class_4_body_w-2*class_4_body_curve, center=true);
                
                translate([-class_4_body_height*1.25+.01,0,0])
                cube(class_4_body_height*2.5, center=true);
            }
        }
    }
    
    util_mirrored([0,1,0])
    translate([-class_4_body_l/2+25, class_4_body_w/4, class_4_hangar_h/2-4])
    cube([class_4_body_l-50, 10, 6], center=true);
    
    util_mirrored([0,1,0])
    translate([-class_4_body_l * .75/2, class_4_body_w/2-12,0])
    cube([class_4_body_l*.75, 16, 10], center=true);
}




module class_4_hangar_door_flat() {
    util_mirrored([1,0,0])
    util_mirrored([0,1,0])
    translate([class_4_hangar_h/2-class_4_body_curve/2,class_4_hangar_w/2-class_4_body_curve/2,0])
    circle(d=class_4_body_curve, $fn=faces_convex);

    square([class_4_hangar_h, class_4_hangar_w-class_4_body_curve], center=true);

    square([class_4_hangar_h-class_4_body_curve, class_4_hangar_w], center=true);
}

module class_4_body_minus() {

    
    translate([-class_4_body_w/2,0,disk_4_height])
    cylinder(d1=disk_1_width, d2=disk_1_width+12, h=6, center=true, $fn=faces_concave);
    
    translate([-class_4_body_l/2,0,disk_4_height])
    cylinder(d1=disk_1_width, d2=disk_1_width+12, h=6, center=true, $fn=faces_concave);
    
    translate([-class_4_body_l, 0, disk_4_height+4])
    cube([20,50,10],center=true);
    
    util_mirrored([0,1,0])
    util_mirrored([0,0,1])
    util_repeat(2, [0,0,10/3])
    translate([-class_4_body_l/2, class_4_body_w/2, 5/3])
    cube([class_4_body_l,2,1.5], center=true);
}

module class_4_bell() {
    intersection() {
        rotate(-90)
        rotate_extrude(angle=180, convexity=2, $fn=faces_concave)
        difference() {
            circle(d=class_4_body_w, $fn=faces_concave);

            circle(d=class_4_body_w-10, $fn=faces_concave);
            
            translate([-class_4_body_w*.75,0,0])
            square(class_4_body_w*1.5, center=true);
        }

        translate([class_4_body_w/3, 0, 100])
        translate([-.6*class_4_body_w, 0, -.6*class_4_body_w])
        cube(1.2*class_4_body_w, center=true);
    }

    intersection() {
        translate([0,0,100])
        translate([class_4_body_w/6, 0, -2.5])
        cube([class_4_body_w/3, 1.2*class_4_body_w, 5], center=true);

        sphere(d=class_4_body_w, $fn=faces_concave);
    }
}

module class_4_body_basic() {
    translate([-.01,0,0])
    scale([2.5,1,1])
    class_4_bell();

    difference() {
        translate([.01,0,0])
        scale([5,1,1])
        mirror([1,0,0])
        class_4_bell();

        translate([-5*class_4_body_w/3,0,-class_4_body_w/2])
        scale([2,1,1])
        rotate([90,0,0])
        cylinder(d=class_4_body_w, h=class_4_body_w*1.2, center=true, $fn=faces_concave);
    }

    intersection() {
        translate([-5*class_4_body_w/3,0,-class_4_body_w/2])
        scale([2,1,1])
        rotate([90,0,0])
        rotate_extrude(angle=90, convexity=3, $fn=faces_concave)
        translate([class_4_body_w/2,0,0])
        translate([2.5,0,0])
        square([5+.01, class_4_body_w*1.2], center=true);

        scale([5,1,1])
        sphere(d=class_4_body_w, $fn=faces_rough);
    }

    difference() {
        intersection() {
            translate([2.5*class_4_body_w/3,0,100])
            translate([-2.5,0,-class_4_body_w/2])
            cube([5, class_4_body_w, class_4_body_w], center=true);

            scale([2.5,1,1])
            sphere(d=class_4_body_w, $fn=faces_rough);
        }

        translate([2.5*class_4_body_w/3,0,0]) {
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0, class_4_body_hangar_w/2-class_4_body_curve, class_4_body_hangar/2-class_4_body_curve]) 
            rotate([0, 90, 0])
            cylinder(r=class_4_body_curve, h=50, center=true, $fn=faces_rough);

            cube([50, class_4_body_hangar_w, class_4_body_hangar-2*class_4_body_curve] ,center=true);

            cube([50, class_4_body_hangar_w-2*class_4_body_curve, class_4_body_hangar], center=true);
        }
    }
    
    util_mirrored([0,1,0])
    translate([-class_4_body_l/4,class_3_secondary_w/2,100])
    rotate([0,90,0]) {
        cylinder(d=20, h=1*class_4_body_l, $fn=faces_rough, center=true);
        
        util_mirrored([0,0,1])
        translate([0,0,class_4_body_l/2])
        sphere(d=20, $fn=faces_rough);
    }

    translate([class_4_body_l/3,0,100-.01])
    disk_0();

    translate([-4*class_4_body_l/5,0,100-.01])
    disk_0();    
}

module class_4_nacelle_new() {
    difference() {
        hull() {
            translate([class_4_nacelle_l/2,0,class_4_nacelle_h/2-class_4_nacelle_w/2])
            sphere(d=class_4_nacelle_w*.75, $fn=faces_rough);

            translate([class_4_nacelle_l/2-class_4_nacelle_h/2,0,-class_4_nacelle_h/2+class_4_nacelle_w/2])
            sphere(d=class_4_nacelle_w*.75, $fn=faces_rough);

            translate([-class_4_nacelle_l/2,0,-class_4_nacelle_h/2+class_4_nacelle_w/2])
            sphere(d=class_4_nacelle_w*.75, $fn=faces_rough);

            translate([0,0,class_4_nacelle_h/2-class_4_nacelle_w/2])
            rotate([0,90,0])
            translate([0,0,class_4_nacelle_l/8])
            cylinder(d=class_4_nacelle_w, h=class_4_nacelle_l/4, center=true, $fn=faces_rough);
        }

        util_mirrored([0,1,0])
        translate([class_4_nacelle_l/6,class_4_nacelle_w/2,0])
        rotate([0,90,0])
        cylinder(d=class_4_nacelle_w/2, h=class_4_nacelle_l/2, center=true, $fn=6);
    }
}



module class_5_hangar() {
    difference() {
        union() {
            util_mirrored([1,0,0])
            translate([class_4_nacelle_l/4, 0, 0])
            intersection() {
                sphere(d=disk_1_width, $fn=faces_convex);

                cube([disk_1_width/2, disk_1_width*1.2, disk_1_width*1.2], center=true);
            }

            rotate([0,90,0])
            cylinder(d=disk_1_width, h=class_4_nacelle_l/2, $fn=faces_convex, center=true);

            util_repeat_rot(3, [45,0,0])
            cube([class_4_nacelle_l/4, disk_1_width, 20], center=true);
        }

        util_mirrored([1,0,0])
        translate([class_4_nacelle_l/4+disk_1_width/4,0,0]) {
            rotate([0,90,0])
            rotate_extrude(angle=360, convexity=3, $fn=faces_concave)
            translate([disk_1_width/2 - 15,0,0])
            square(3, center=true);
            
            cube([3, 2*(disk_1_width/2 - 15), 3], center=true);
        }
    }
}

module class_5_neck() {
    
    util_repeat(4, [0,0,-40])
    translate([-50,0,-75])
    cube([80, 25, 25], center=true);
    
    util_repeat(4, [0,0,-40])
    translate([-10,0,-75])
    cylinder(d=25, h=25, center=true, $fn=faces_rough);
    
    translate([0,0,0])
    intersection() {
        union() {
            translate([-class_4_nacelle_disp,0,-class_4_neck_curve])
            rotate([90,0,0])
            rotate(-90)
            rotate_extrude(angle=180,convexity=3, $fn=faces_concave)
            translate([class_4_neck_curve,0,0])
            circle(d=20, $fn=faces_rough);

            difference() {
                translate([-250-10,0,-250])
                cube([500, 20, 500], center=true);

                translate([-class_4_nacelle_disp,0,-class_4_neck_curve])
                rotate([90,0,0])
                cylinder(h=30, r=class_4_neck_curve, center=true);
            }

            translate([-10,0,-250])
            cylinder(d=20, h=500, $fn=faces_rough, center=true);
        }

        translate([-class_4_nacelle_disp/2,0,-class_4_nacelle_sep/2])
        cube([class_4_nacelle_disp, 30, class_4_nacelle_sep], center=true);
    }
}

module class_5_secondary(theta) {
    rotate([theta,0,0]) {
        class_5_neck();
        
        translate([-class_4_nacelle_disp*.25, 0, -class_4_nacelle_sep])
        class_5_hangar();
        
        util_mirrored([0,1,0])
        rotate([45,0,0]) {
            util_mirrored([0,0,1])
            translate([-class_4_nacelle_l/2-disk_1_width/2,0,class_4_nacelle_h/2+10])
            class_4_nacelle_new();

            translate([-1.8*disk_1_width,0,0]) {
                cube([disk_1_width, 20, disk_1_width], center=true);

                util_mirrored([1,0,0])
                translate([disk_1_width/2,0,0])
                cylinder(d=20, h=disk_1_width, center=true, $fn=faces_rough);
            }
        }

        rotate([-theta,0,0]) {
            translate([disk_1_width/2,0,.75*disk_1_width/2-.01])
            disk_1();

            difference() {
                scale([2.5,1,1])
                intersection() {
                    sphere(d=disk_1_width, $fn=faces_convex);

                    translate([disk_1_width/6-.01,0,0])
                    cube([disk_1_width/3, disk_1_width*1.2, disk_1_width*1.2], center=true);
                    
                    translate([0,0,.75*disk_1_width/2])
                    translate([0,0,-.6*disk_1_width])
                    cube(1.2*disk_1_width, center=true);
                }

                translate([2.5*disk_1_width/3,0,0])
                scale([.75,1,1])
                sphere(d=.5*disk_1_width, $fn=faces_concave);
            }
        }

        scale([5,1,.2])
        intersection() {
            sphere(d=disk_1_width, $fn=faces_convex);

            translate([-.6*disk_1_width+.01,0,0])
            cube(disk_1_width*1.2, center=true);
        }

        scale([7.5,.3,.3])
        intersection() {
            sphere(d=disk_1_width, $fn=faces_convex);

            translate([-.6*disk_1_width+.01,0,0])
            cube(disk_1_width*1.2, center=true);
            
            translate([-disk_1_width/3,0,0])
            translate([.6*disk_1_width+.01,0,0])
            cube(disk_1_width*1.2, center=true);
        }

        sphere(d=disk_1_width*.8, $fn=faces_convex);
    }
}

module class_4_body_old() {
    difference() {
        class_4_body_plus();
        class_4_body_minus();
    }
    
    translate([-class_4_body_w/2,0,disk_4_height-3.1])
    disk_1();
    
    translate([-class_4_body_l+disk_0_width,0,class_4_body_height*.448]) rotate(180) disk_0();
}


