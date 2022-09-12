use <../lib/util.scad>;


small_faces_smooth=128;
small_faces_medium=64;
small_faces_coarse=32;
small_faces_rough=16;

module small_disk(width, height, ratio) {
    difference() {
        intersection() {
            scale([1,1,ratio])
            sphere(d=width, $fn=small_faces_smooth);

            translate([0,0,width/2+2])
            cube(width+4, center=true);
        }

        translate([0,0,height/2])
        rotate_extrude(angle=360, convexity=10, $fn=128)
        translate([width/2,0,0])
        square([2,.25], center=true);
        
        translate([0,0,width/2+2+height])
        cube(width+4, center=true);
    }
    
//    difference() {
//        intersection() {
//            scale([1,1,small_ratio])
//            rotate([0,-90,0])
//            translate([0,0,small_width/4])
//            cylinder(d=small_width, h=small_width/2, center=true, $fn=small_faces_smooth);
//
//            translate([0,0,small_width/2+2])
//            cube(small_width+4, center=true);
//        }
//        
//        util_mirrored([0,1,0])
//        translate([-small_width/4-1,small_width/2,small_height/2])
//        cube([small_width/2+2,2,.25], center=true);
//        
//        translate([0,0,small_width/2+2+small_height])
//        cube(small_width+4, center=true);
//    }
}

module small_engine(length, width, ratio, offset) {
    difference() {
        intersection() {
            scale([ratio,1,1])
            sphere(d=width, $fn=small_faces_smooth);

            translate([offset,0,0])
            cube(length, center=true);
            
            translate([0,length-width,0])
            cube(length*2, center=true);
        }
        
        translate([length/2+offset,0,0])
        scale([.25,1,1])
        sphere(d=width*.75, $fn=small_faces_smooth);
    }
}


module small_nacelle_flat(width) {
    circle(d=width, $fn=small_faces_medium);

    hull() {
        translate([width/4,0,0])
        square([width/2,width], center=true);

        translate([width/2+width/4,0,0])
        square(width/2, center=true);
    }
}

module small_nacelle_core(width) {
    rotate_extrude(angle=360, convexity=10, $fn=small_faces_medium)
    intersection() {
        rotate(90)
        small_nacelle_flat(width);

        translate([20,0,0])
        square(40, center=true);
    }
}

module small_nacelle_corner(width) {
    rotate_extrude(angle=90, convexity=10, $fn=small_faces_medium)
    intersection() {
        small_nacelle_flat(width);

        translate([20,0,0])
        square(40, center=true);
    }
}

module small_nacelle_1(width, ratio) {
    scale([ratio,1,1])
    rotate([0,-90,0])
    intersection() {
        small_nacelle_core(width);
        translate([0,0,20])
        cube(40, center=true);
    }

    small_nacelle_core(width);

    scale([ratio,1,1])
    rotate([90,0,0])
    rotate(90)
    small_nacelle_corner(width);
}

module small_nacelle_2(width, ratio) {
    translate([0,0,width])
    mirror([0,0,1])
    small_nacelle_1(width, ratio);
}

module small_nacelle_3(width, ratio) {
    scale([ratio,1,1])
    rotate([0,-90,0])
    intersection() {
        small_nacelle_core(width);
        translate([0,0,20])
        cube(40, center=true);
    } 
    
    sphere(d=width, $fn=small_faces_smooth);
}

module small_nacelle(width, ratio) {
    small_nacelle_1(width, ratio);
}

module small_hangar_flat(width, ratio) {
    intersection() {
        translate([0,1.5,0])
        scale([1,ratio,1])
        circle(d=width, $fn=small_faces_medium);

        translate([width/2, width/2,0])
        square(width, center=true);
    }
}

module small_hangar(length, width, height, ratio) {
    difference() {
        union() {
            rotate_extrude(angle=360, convexity=10, $fn=small_faces_smooth)
            small_hangar_flat(width, ratio);

            rotate([0,-90,0])
            rotate(-90)
            linear_extrude(height=length, convexity=10)
            util_mirrored([1,0,0])
            small_hangar_flat(width, ratio);
        }

        translate([0,0,height])
        translate([0,0,50])
        cube(100, center=true);
        
        translate([-length+.1,0,.5])
        rotate([0,-90,0])
        rotate(-90)
        linear_extrude(height=.2, convexity=10)
        util_mirrored([1,0,0])
        scale([.85,.8,1])
        difference() {
            small_hangar_flat(width, ratio);
            
            translate([0,20+height,0])
            square(40, center=true);
        }
    }
}