use <../lib/util.scad>
include <common.scad>

module window() {
    translate([2,0,0])
    cube([5, 2, 1], center=true);
}

module porthole() {
    translate([2,0,0])
    rotate([0,90,0])
    cylinder(d=.75, h=5, center=true, $fn=12);
}

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

module disk_1_plus(){
    h_adj=disk_1_height-2*disk_0_deck_h;
    
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


module disk_1() {
    difference() {
        disk_1_plus();
        disk_1_minus();
    }
}

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


ratio1=(disk_4_width/2)/(disk_4_width/2-disk_3_height/2);
ratio2=(disk_3_body_width-disk_3_height)/disk_3_body_width;

ratio3=(disk_4_width/2-disk_3_height)/(disk_4_width/2-disk_3_height/2);

module disk_3_plus_old() {
    translate([0,0,-disk_3_height/4+.01])
    cylinder(d1=disk_3_width-disk_3_height, d2=disk_3_width, h=disk_3_height/2+.02, center=true, $fn=faces_convex); 

    translate([0,0,disk_3_height/4-.01])
    cylinder(d1=disk_3_width, d2=disk_2_width+disk_3_height/2, h=disk_3_height/2+.02, center=true, $fn=faces_convex); 

    translate([0,0,.01])
    mirror([0,0,1])
    linear_extrude(height=disk_3_height/2+.02, convexity=true, scale=[ratio1, ratio2])
    translate([-0.5*(disk_4_width/2-disk_3_height/2),0,0])
    square([disk_4_width/2-disk_3_height/2,disk_3_body_width], center=true);

    linear_extrude(height=disk_3_height/2+.02, convexity=true, scale=[ratio3, 1])
    translate([-0.5*(disk_4_width/2-disk_3_height/2),0,0])
    square([disk_4_width/2-disk_3_height/2,disk_3_body_width], center=true);
}

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

module disk_4_flat() {
    intersection() {
        union() {
            translate([disk_4_upper/2,0,0])
            scale([(disk_4_width-disk_4_upper)*.5/disk_4_height,1,1])
            circle(d=disk_4_height*2, $fn=faces_convex);

            square([disk_4_upper, disk_4_height*2], center=true);
        }

        translate([disk_4_width/2, disk_4_width/2-.05, 0])
        square(disk_4_width, center=true);
    }
}

module disk_4_base_1_old() {
    translate([0,0,disk_4_height/2-.01])
    cylinder(d1=disk_4_width, d2=disk_4_upper, h=disk_4_height+.02, center=true, $fn=faces_concave);
}

module disk_4_base_1() {
    translate([0,0,disk_4_height-disk_3_height-.01])
    translate([0,0,disk_3_height/2])
    cylinder(d1=disk_4_width, d2=disk_4_upper, h=disk_3_height, center=true, $fn=faces_concave);

    translate([0,0, (disk_4_height-disk_3_height)/2])
    cylinder(h=disk_4_height-disk_3_height, d2=disk_4_width, d1=disk_4_width-1.5*(disk_4_height-disk_3_height), center=true, $fn=faces_concave);
}

module disk_4_base_2() {
    rotate_extrude(angle=360, convexity=2, $fn=faces_concave)
    disk_4_flat();
}

module disk_4_base_3() {
    translate([0,0,(10+20/3)]) {
        translate([0,0,-(10+20/3)/2])
        cylinder(d1=disk_4_width-2*(20/3+10), d2=disk_4_width, h=(20/3+10)+0.02, $fn=faces_concave, center=true);

        translate([0,0,0.5*(disk_4_height-(10+20/3))])
        cylinder(d1=disk_4_width, d2=disk_4_upper, h=disk_4_height-(10+20/3)+.02, $fn=faces_concave, center=true);
    }
}

module disk_4_base() {
    disk_4_base_3();
}


module class_4_body_base_1(ratio=4) {
    intersection() {
            rotate([0,-90,0])
            linear_extrude(height=disk_4_upper/2+10+disk_2_width+class_4_body_l, convexity=3) class_4_body_basic_flat(class_4_body_curve);

            translate([-(disk_4_upper + 2*(disk_2_width+10))/2,0,ratio*class_4_body_l])
            rotate([90,0,0])
            rotate_extrude(angle=360, convexity=3, $fn=faces_concave*2)
            translate([ratio*class_4_body_l,0,0])
            rotate(180)
            class_4_body_basic_flat(class_4_body_curve);
        }
}

module class_4_body_basic_flat(r) {
    translate([disk_4_height-25,0,0])
    square([50, class_4_body_w+10], center=true);

    util_mirrored([0,1,0])
    translate([r-class_4_body_h_extra,class_4_body_w/2+5+25-r,0])
    intersection() {
        circle(d=2*r, $fn=faces_convex);
        
        translate([-r/2,r/2,0])
        square(r, center=true);
    }

    util_mirrored([0,1,0])
    translate([disk_4_height-25,class_4_body_w/2+5,0])
    circle(d=50, $fn=4);
    
    translate([(disk_4_height + class_4_body_h_extra)/2-class_4_body_h_extra, 0,0])
    square([disk_4_height + class_4_body_h_extra, class_4_body_w+10+50-2*r], center=true);
    
    difference() {
        translate([(disk_4_height-25)/2,0,0])
        square([disk_4_height-25, class_4_body_w+10+50], center=true);
        
        translate([r-class_4_body_h_extra,0,0])
        translate([-r/2,0,0])
        square([r, class_4_body_w+10+50], center=true);
    }
}

module disk_4_hangar_minus() {
    intersection() {
        union() {
            cube([disk_4_hangar_l, disk_4_hangar_w, disk_4_hangar_h-5], center=true);

            cube([disk_4_hangar_l, disk_4_hangar_w-5, disk_4_hangar_h], center=true);

            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0, (disk_4_hangar_w-5)/2, (disk_4_hangar_h-5)/2])
            rotate([0,90,0])
            cylinder(d=5, h=disk_4_hangar_l, $fn=faces_rough, center=true);
        }
        
        rotate([0,-52.5,0])
        cube([120,120,50],center=true);
    }
}

disk_4_new();

module disk_4_new(command=true) {
    difference() {
        intersection() {
            union() {
                disk_4_base_1();
                class_4_body_base_1(.75);
            }

            cube(disk_4_upper + 2*(disk_2_width+10), center=true);
        }

        translate([0,0,disk_4_height+.01])
        cylinder(d1=disk_3_width, d2=disk_4_upper, h=2*disk_3_height, center=true, $fn=faces_concave);
        
        cylinder(d1=2.5*disk_2_width, d2=.5*disk_2_height, h=3*disk_4_height, center=true, $fn=faces_concave);
        
        cylinder(d=disk_2_width-20, h=disk_4_height*2, center=true, $fn=faces_concave);
        
        translate([-disk_2_width/2-disk_4_upper/2,0,disk_4_height])
        cylinder(h=11, d1=disk_2_width, d2=disk_2_width+11, center=true, $fn=faces_concave);
        
        if (command == false) {
            translate([-disk_2_width/2-disk_4_upper/2,0,disk_4_height-5.5+.05])
            disk_0_under_2();
        }
        
        translate([disk_4_width/2,0,30])
        disk_4_hangar_minus();
        
        rotate(90)
        translate([disk_4_width/2,0,30])
        disk_4_hangar_minus();
        
        rotate(-90)
        translate([disk_4_width/2,0,30])
        disk_4_hangar_minus();
        
    }
    

}




module disk_4_plus() {
    disk_4_base();

    translate([-disk_4_width/4,0,disk_4_height/2])
    cube([disk_4_width/2, class_4_body_w-2*class_4_body_upper_curve, disk_4_height], center=true);

    translate([-disk_4_width/4,0,disk_4_height/2-class_4_body_upper_curve/2])
    cube([disk_4_width/2, class_4_body_w, disk_4_height-class_4_body_upper_curve], center=true);

    util_mirrored([0,1,0])
    translate([-disk_4_width/4,class_4_body_w/2-class_4_body_upper_curve,disk_4_height-class_4_body_upper_curve])
    rotate([0,90,0])
    cylinder(r=class_4_body_upper_curve, h=disk_4_width/2, center=true, $fn=faces_rough);
    
    translate([0,0,-5+.01])
    cylinder(d1=disk_1_width-20, d2=disk_1_width, h=10, $fn=faces_convex, center=true);

    translate([0,0,-12.5+.01])
    cylinder(d1=disk_0_width-10, d2=disk_0_width, h=5+.02, center=true, $fn=faces_convex);
    
    translate([disk_3_width/4 + disk_4_upper/4 + 5,0,disk_4_height-.01])
    disk_0();
    
    util_mirrored([0,1,0])
    translate([-disk_4_width/2,40,0])
    scale([2,1,.8])
    intersection() {
        rotate([0,45,0])
        cube([80,40, 80], center=true);

        translate([100-.01,0,-100+.01])
        cube(200, center=true);
    }
}

module disk_4_minus() {
    translate([0,0,disk_4_height-disk_3_height/4+.01])
    cylinder(d1=disk_3_width-disk_3_height, d2=disk_3_width, h=disk_3_height/2+.02, center=true, $fn=faces_concave);
    
    translate([0,0,disk_4_height])
    cylinder(d=disk_3_width+6,h=6, center=true, $fn=faces_concave);
    
    translate([0,0,disk_4_height+.1])
    mirror([0,0,1])
    linear_extrude(height=disk_3_height/2+.02, convexity=true, scale=[ratio1, ratio2])
    translate([-0.5*disk_4_width*.75,0,0])
    square([disk_4_width*.75,disk_3_body_width], center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_4_width/2,40,disk_4_height/4])
    cube([2, 40, 10], center=true);
    
    rotate_extrude(angle=360, convexity=10, $fn=faces_convex)
    translate([disk_3_width/2,0,0])
    square([disk_2_width, 2], center=true);
    
    util_mirrored([0,1,0])
    util_repeat_rot(7, [0,0,360/16])
    translate([disk_4_width/2,0,8.33])
    cube([50,50,10], center=true);
        
    util_mirrored([0,1,0])
    util_repeat_rot(39, [0,0,4])
    translate([disk_4_width/2-(20/3+10), 0, 5/3]) 
    scale([1,8,1]) window();
    
    util_mirrored([0,1,0])
    util_repeat_rot(39, [0,0,4])
    translate([disk_4_width/2-5, 0, (20/3+10)-5/3]) 
    scale([1,10,1]) window();
}


module disk_4_old() {
    difference() {
        disk_4_plus();
        disk_4_minus();
    }
}



module disk_4() {
    translate([0,0,disk_4_height/2-.01])
    difference() {
        cylinder(d1=disk_4_width, d2=disk_4_upper + disk_0_width,h=disk_4_height, center=true, $fn=faces_concave*2);

        cylinder(d=disk_4_upper, h=1.2*disk_4_height, center=true, $fn=faces_concave);
        
        util_repeat_rot(5, [0,0,30])
        translate([0,0,disk_4_height/2])
        cube([disk_4_width*1.5, disk_1_width*.75, disk_4_height*1.5], center=true);
    }

    difference() {
        rotate_extrude(angle=360, convexity=3, $fn=faces_concave*2)
        translate([disk_4_upper/2+1,0,0])
        scale([(disk_4_width-disk_4_upper)/(2*disk_4_height),1,1])
        intersection() {
            circle(d=1.8*disk_4_height, $fn=4);
            
            translate([.75*disk_4_height, .75*disk_4_height,0])
            square(1.5*disk_4_height, center=true);
        }
        
        util_repeat_rot(4, [0,0,-30])
        rotate(-30)
        translate([disk_4_width/2-60,0,20])
        cube([50,50,10], center=true);
        
        util_repeat_rot(5, [0,0,30])
        translate([disk_4_width/2-60,0,20])
        cube([50,50,10], center=true);
    }
    
    translate([-disk_4_width/2,0,0.05])
    scale([1.5,2,disk_1_width*4/disk_4_width])
    translate([disk_4_width/8,0,-disk_4_width/8]) {
        difference() {
            cube([disk_4_width/4, disk_0_width, disk_4_width/4], center=true);
            
            translate([disk_4_width/8, 0, -disk_4_width/8])
            rotate([90,0,0])
            cylinder(r=disk_4_width/5, h=disk_1_width, $fn=faces_concave, center=true);
        }

        translate([disk_4_width/8, 0, -disk_4_width/8])
        rotate(180)
        rotate([90,0,0])
        rotate_extrude(angle=90, convexity=3, $fn=faces_convex)
        translate([disk_4_width/5,0,0])
        square(10, center=true);
    }

    translate([-disk_4_width/2+disk_1_width,0,-.01]) 
    scale([1,1,.6])
        {
        intersection() {
            rotate([90,0,0])
            difference() {
                cylinder(h=2*disk_0_width, r=disk_1_width, center=true, $fn=faces_convex);
                
                rotate_extrude(angle=360, convexity=3, $fn=faces_concave)
                translate([disk_1_width,0,0])
                square(10, center=true);
            }

            translate([-disk_2_width/2,0,disk_2_width/2])
            cube(disk_2_width, center=true);
        }

        translate([-disk_0_width,0,disk_1_width/2])
        cylinder(r=disk_0_width, h=disk_1_width, center=true, $fn=faces_convex);
    }
    
    intersection() {
        translate([0,0,-disk_2_height-10])
        cylinder(d1=disk_0_width, d2=disk_2_width*1.5, h=disk_2_height*2, center=true, $fn=faces_convex);

        cylinder(d1=disk_2_width*1.5, d2=disk_1_width, h=300, $fn=faces_convex, center=true);
    }

    translate([0,0,-disk_2_height*2-10+.01]) disk_0_under_2();
}