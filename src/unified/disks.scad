use <../lib/util.scad>
include <common.scad>

module disk_0_plus() {
    translate([0,0,disk_0_deck_h/2])
    cylinder(d1=disk_0_width, d2=(disk_0_width-2*disk_0_deck_h), h=disk_0_deck_h, center=true, $fn=faces_convex);

    translate([0,0,disk_0_deck_h])
    cylinder(d1=(disk_0_upper_d+4*disk_0_deck_h), d2=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);

    linear_extrude(convexity=10, height=2*disk_0_deck_h, scale=[1,(disk_0_upper_d/ (disk_0_upper_d+4*disk_0_deck_h))])
    translate([-disk_0_width/4,0,0])
    square([disk_0_width/2, disk_0_upper_d+4*disk_0_deck_h], center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_0_width/2, disk_0_upper_d/2 + disk_0_deck_h/2, disk_0_deck_h/2+.5])
    sphere(d=.8*disk_0_deck_h, $fn=faces_convex);
}

module disk_0_under() {
    difference() {
        translate([0,0,-disk_0_deck_h])
        cylinder(d2=(disk_0_upper_d+4*disk_0_deck_h), d1=disk_0_upper_d, h=disk_0_deck_h*2, center=true, $fn=faces_convex);
        
        translate([0,0,-2*disk_0_deck_h])
        cylinder(d2=disk_0_upper_d-2, d1=disk_0_upper_d, h=.5, center=true, $fn=faces_convex);
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

module disk_0_minus() {
    translate([0,0,2*disk_0_deck_h])
    cylinder(d1=disk_0_upper_d-2, d2=disk_0_upper_d, h=.5, center=true, $fn=faces_convex);
    
    translate([-disk_0_width/2,0,disk_0_deck_h])
    cube([.5, disk_0_upper_d-1, 2*disk_0_deck_h-1], center=true);
    
    util_mirrored([0,1,0])
    translate([-disk_0_width/2-.4*disk_0_deck_h, disk_0_upper_d/2 + disk_0_deck_h/2, disk_0_deck_h/2+.5])
    sphere(d=.6*disk_0_deck_h, $fn=faces_convex);
}

module disk_0() {
    difference() {
        disk_0_plus();
        disk_0_minus();
    }
}

module disk_1_plus() {
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
    
    translate([0,0,.01]) disk_0_under_2();
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

module disk_3_plus() {
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
    translate([0,0,disk_3_height/2])
    cylinder(d=disk_2_width+6, h=12-.08, center=true, $fn=faces_concave);
    
    translate([-disk_2_width/2-disk_1_width/2-disk_0_width,0,disk_3_height/2])
    cylinder(d1=disk_1_width, d2=disk_1_width+13.33, h=6.5, center=true, $fn=faces_concave);
    
    util_mirrored([0,1,0])
    translate([-disk_4_width/2+disk_3_height/2,36,0])
    rotate([0,45,0])
    cube([2, 60, 40], center=true);
    
    translate([0,0,disk_3_height/2-6+.05]) disk_0_under_2();
}

module disk_3() {
    difference() {
        disk_3_plus();
        disk_3_minus();
    }
    
    translate([-disk_2_width/2-disk_1_width/2-disk_0_width,0,disk_3_height/2-3.35]) disk_1();
}

module disk_4_plus() {
    translate([0,0,disk_4_height/2-.01])
    cylinder(d1=disk_4_width, d2=disk_4_upper, h=disk_4_height+.02, center=true, $fn=faces_concave);

    translate([-disk_4_width/4,0,disk_4_height/2])
    cube([disk_4_width/2, class_4_body_w-2*class_4_body_curve, disk_4_height], center=true);

    translate([-disk_4_width/4,0,disk_4_height/2-class_4_body_curve/2])
    cube([disk_4_width/2, class_4_body_w, disk_4_height-class_4_body_curve], center=true);

    util_mirrored([0,1,0])
    translate([-disk_4_width/4,class_4_body_w/2-class_4_body_curve,disk_4_height-class_4_body_curve])
    rotate([0,90,0])
    cylinder(r=class_4_body_curve, h=disk_4_width/2, center=true, $fn=faces_rough);
    
    translate([0,0,-5+.01])
    cylinder(d1=disk_1_width-20, d2=disk_1_width, h=10, $fn=faces_convex, center=true);

    translate([0,0,-12.5+.01])
    cylinder(d1=disk_0_width-10, d2=disk_0_width, h=5+.02, center=true, $fn=faces_convex);
    
    translate([disk_3_width/4 + disk_4_upper/4 + 5,0,disk_4_height-.01])
    disk_0();
    
    util_mirrored([0,1,0])
    translate([-disk_4_width/2,class_4_body_w/2-5,0])
    scale([2,1,.8])
    intersection() {
        rotate([0,45,0])
        cube([80,10, 80], center=true);

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
    translate([disk_4_width/2-15,0,8.33])
    cube([50,50,10], center=true);
}





module disk_4() {
    difference() {
        disk_4_plus();
        disk_4_minus();
    }
    
    util_mirrored([0,1,0])
    util_repeat_rot(7, [0,0,360/16])
    translate([disk_4_width/2-36,0,3.33])
    cube([48,48,1], center=true);
}

