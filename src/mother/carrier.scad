use <../lib/util.scad>;
include <common.scad>;

module carr_upper_plane() {
    util_mirrored([1,0,0])
    translate([carrier_length/2,0,0]) {
        rotate(-90)
        rotate_extrude(angle=180, $fn=faces_convex)
        translate([hangar_width/2+10,0,0])
        circle(d=20, $fn=faces_rough);
        
    }

    util_mirrored([0,1,0])
    translate([0,hangar_width/2+10,0])
    rotate([0,90,0])
    cylinder(d=20, h=carrier_length, center=true, $fn=faces_rough);
    

}


module carr_body_filter() {
    translate([0,0,-150])
    cube([carrier_length+hangar_width, hangar_width+20+20, 300], center=true);

    util_mirrored([0,1,0])
    translate([0,hangar_width/2+10,0])
    rotate([0,90,0])
    cylinder(h=carrier_length+hangar_width, d=20, $fn=faces_rough, center=true);

    cube([carrier_length+hangar_width, hangar_width+20, 20], center=true);
}

module carr_body_shape() {
    intersection() {
        carr_body_filter();
        carr_body_curve();
        carr_hex_filter();
    }
}

module carr_body_plus() {
    translate([-hangar_width*.75,0,0])
    carr_body_shape();
    carr_upper_plane();

    difference() {
        translate([carrier_length/4,0,0])
        cube([carrier_length/2, hangar_width+20, 20], center=true);
        
        translate([carrier_length/2,0,0])
        cylinder(d=hangar_width+20, h=30, center=true);
    }

    translate([carrier_length/2,0,0]) 
    rotate(90)
    rotate_extrude(angle=180, $fn=faces_convex)
    translate([hangar_width/2+10,0,0])
    circle(d=20, $fn=faces_rough);

    translate([-carrier_length/2,0,0]) difference() {
        cylinder(d=hangar_width+20, h=20, center=true);
        
        translate([hangar_width,0,0]) cube(2*hangar_width, center=true);
    }

    translate([-carrier_length/2,0,0])
    rotate([90,0,0])
    cylinder(h=hangar_width+20, d=20, $fn=faces_rough, center=true);
    
    translate([0,0,10-.01]) disk_1();
    
    translate([-carrier_length/4,0,0])
    cube([carrier_length/2, hangar_width+20, 10], center=true);

}

module carr_octagon(length) {
    intersection() {
        cube([length,30,30], center=true);
        rotate([45,0,0])
        cube([length+20, 36, 36], center=true);
    }
}

module carr_bar() {
    translate([0,0,hangar_width*.8/2])
    rotate([90,0,0]) {
        util_mirrored([0,1,0])
        util_mirrored([1,0,0])
        translate([hangar_width*.8/2-20-.01, hangar_width*.8/2-20-.01, 0])
        rotate_extrude(angle=90, $fn=faces_convex)
        translate([20,0,0])
        circle(d=20, $fn=faces_rough);

        util_mirrored([1,0,0])
        translate([hangar_width*.8/2-.01,0,0])
        rotate([90,0,0])
        cylinder(d=20, h=hangar_width*.8-40, $fn=faces_rough, center=true);

        util_mirrored([0,1,0])
        translate([0, hangar_width*.8/2-.01,0])
        rotate([0,90,0])
        cylinder(d=20, h=hangar_width*.8-40, $fn=faces_rough, center=true);
        
        difference() {
            cube([hangar_width*.8, hangar_width*.8, 10], center=true);
            cylinder(d=hangar_width/2, h=30, center=true, $fn=faces_rough);
        }
        
        rotate_extrude(angle=360, $fn=faces_convex)
        translate([hangar_width/4,0,0])
        circle(d=10, $fn=faces_rough);
    }
}

module carr_bar_box(length) {
    intersection() {
        cube([length, 30, 30], center=true);
        rotate([0,90,0])
        cylinder(d=50, h=length+20, $fn=4, center=true);
    }
}

module carr_assembly(theta) {
    translate([0,30,0]) {
        rotate([-theta,0,0]) {
            carr_bar();
            translate([0,0,hangar_width*.8]) 
            rotate([theta,0,0]) carr_bar_box(hangar_width/2);
        }

        carr_bar_box(hangar_width/2);
        translate([0,-30+.01,0]) carr_bar_box(hangar_width);
    }
}

module carr_rear_assembly() {
    util_mirrored([0,1,0]) {
        warp_base_pos()
        carr_assembly(carrier_theta);

        warp_base_pos() warp_top_pos() 
        translate([-20,30-.01,-10])
        nacelle(30, 20, carrier_width);
    }
}

module carr_body() {
    difference() {
        carr_body_plus();
        carr_body_minus();
    }
    
    intersection() {
        translate([-hangar_width*.75,0,0])
        scale(.75) carr_hex_filter();
        translate([-carrier_length/4+20,0,-hangar_height/2-10])
        cube ([carrier_length/2, hangar_width+10, hangar_height+10], center=true);
    }
    
    intersection() {
        translate([-hangar_width*.75,0,0])
        scale(.98) carr_hex_filter();
        
        translate([carrier_length/4-20,0,-hangar_height/2-10])
        rotate([0,90,0])
        cylinder(d=hangar_height, h=carrier_length/4+30, center=true);
    }
}

module carr_body_minus() {
    translate([-hangar_width/2, 0, -hangar_height/2-10])
    cube ([hangar_width, hangar_width, hangar_height], center=true);
    
    translate([carrier_length/4, 0, -hangar_height/2-10])
    rotate([0,90,0])
    cylinder(d=hangar_height-10, h=carrier_length/4, $fn=faces_concave, center=true);
}



module carr_body_curve() {
    translate([0,0,carrier_length*0.8660254*.64])
    scale([1,1,.64])
    rotate([90,0,0]) {
        rotate_extrude(angle=360, $fn=2*faces_concave)
        translate([carrier_length,0,0])
        circle(d=hangar_width+20+20, $fn=faces_convex);
        
        cylinder(h=hangar_width+20+20, d=2*carrier_length, center=true);
    }
}


module carrier() {
    carr_body();
    carr_rear_assembly();
}

module carr_hex_filter() {
    translate([carrier_length/4,0,carrier_length*.64/4-75])
    scale([1,1,1])
    rotate([90,0,0])
    cylinder(d=carrier_length*.64, h=hangar_width*2, center=true, $fn=6);
}

carrier();