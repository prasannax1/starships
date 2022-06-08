use <../lib/util.scad>;

faces_rough=32;
faces_convex=64;
faces_concave=100;

saucer_width=750;
saucer_upper=640;
saucer_height=50;

labs_width=400;
labs_height=30;

command_width=150;
command_height=25;
command_theta=45;

scout_width=100;
scout_height=10;

bridge_width=32;
bridge_height=4;

warp_length=900;

hex_size=50;
carrier_width=250;
carrier_length=900;
hangar_height=80;
hangar_width=180;
carrier_theta=60;

module hex() {
    rotate(90)
    cylinder(d=hex_size, h=4*command_height, $fn=6, center=true);
}

module disk(d, h, faces, curve_factor=2.5) {
    difference() {
        intersection() {
            scale([1,1,curve_factor*h/d])
            sphere(d=d, $fn=faces);
            
            translate([0,0,d-.01])
            cube(2*d, center=true);
        }
        
        translate([0,0,d+h+.01])
        cube(2*d, center=true);
    }
}

module semi(d, h, faces) {
    intersection() {
        scale([1,1,2*h/d])
        sphere(d=d, $fn=faces);
        
        translate([0,0,d-.01])
        cube(2*d, center=true);
    }
}


module disk_0() {
    disk(bridge_width, bridge_height, faces_rough, 2.8);
}

module disk_1(bottom_open=false) {
    difference() {
        semi(scout_width, scout_height, faces_convex);
        
        translate([0,0,scout_height-bridge_height/2])
        cylinder(d1=bridge_width, d2=bridge_width*1.1, h=bridge_height, $fn=faces_concave, center=true);
        
        translate([-scout_width/2,0,0])
        cube([50, 12-.02, 30], center=true);
        
        if (bottom_open == true) {
            cylinder(d=18, h=1, $fn=faces_concave, center=true);
        }
    }
    
    translate([0,0,scout_height-bridge_height-.01])
    disk_0();
    
    util_mirrored([0,1,0])
    translate([-scout_width/4, 12, 3.6])
    scale([1,2,1])
    rotate([0,90,0])
    rotate(90)
    cylinder(d=6, h=scout_width/2, $fn=6, center=true);
}


module disk_2() {
    disk_h = 10;
    
    translate([0,0,disk_h/2])
    cylinder(d1=command_width, d2=command_width-2*disk_h, h=disk_h, $fn=faces_convex, center=true);
    
    
    intersection() {
        hull() {
            translate([0,0,disk_h+7/2-.01])
            cylinder(d1=60, d2=60-14, h=7, $fn=faces_convex, center=true);
            
            translate([-30,0,disk_h+7/2-.01])
            cylinder(d1=30, d2=30-14, h=7, $fn=faces_convex, center=true);
        }
        
        cube(60, center=true);
    }
    
    translate([0,0,disk_h + 7 - .02]) disk_0();
    
    translate([0,0,-5+.01])
    cylinder(d2=50, d1=50-20, h=10, center=true, $fn=faces_convex);
    
    translate([0,0,-10])
    scale([1,1,.5])
    sphere(d=20, $fn=faces_convex);
    
    hull()
    util_mirrored([0,1,0])
    translate([-command_width/4, 10, 5])
    scale([1,2,1])
    rotate([0,90,0])
    rotate(90)
    cylinder(h=command_width/2, d=10, $fn=6, center=true);
}

module disk_3(show_hole=false) {
    difference() {
        disk(labs_width, labs_height, faces_convex, 3);
        
        if (show_hole == true) {
            cylinder(d=50, h=3*labs_height, center=true,$fn=faces_concave);
        }
    }
}    

module disk_4() {
    hull()
    rotate_extrude(angle=360, $fn=faces_concave) {
        translate([saucer_width/2-5,5,0])
        circle(d=10, $fn=faces_rough);

        translate([saucer_upper/2-5, saucer_height-5,0])
        circle(d=10, $fn=faces_rough);
    }
    
    translate([0,0, -15+.01])
    cylinder(d2=hangar_width, d1=(command_width+scout_width)/2, $fn=faces_convex, h=30, center=true);
}

module nacelle(w, h, l) {
    difference() {
        union() {
            util_mirrored([0,0,1])
            util_mirrored([1,0,0])
            translate([l/2, 0, h/2])
            sphere(d=w, $fn=faces_rough);
            
            util_mirrored([1,0,0])
            translate([l/2,0,0])
            cylinder(h=h, d=w, center=true, $fn=faces_rough);
            
            util_mirrored([0,0,1])
            translate([0,0,h/2])
            rotate([0,90,0])
            cylinder(h=l, d=w, center=true, $fn=faces_rough);
            
            cube([l, w, h], center=true);
        }
        
        util_mirrored([0,1,0])
        translate([0, w/2, 0])
        rotate([0,90,0])
        cylinder(d=w/4, h=l-w/2, center=true, $fn=faces_concave);
    }
}

module command_pos() {
    translate([command_width/2.75,0,28-.01]) children();
}



module warp_base_pos() {
    translate([-carrier_length/3, hangar_width/2+10, 0])
    children();
}

module warp_top_pos() {
    translate([0,30,0]) 
    rotate([-carrier_theta,0,0]) 
    translate([0,0,hangar_width*.8]) 
    rotate([carrier_theta,0,0])
    children();
}

module warp_pos() {
    warp_base_pos()
    warp_top_pos()
    translate([0,0,15-.01])
    children();
}

module saucer_pos() {
    translate([carrier_length/2,0,10-.01])
    children();
}

module labs_pos() {
    saucer_pos()
    translate([0,0,saucer_height-.01])
    children();
}

module command_pos() {
    labs_pos()
    translate([0,0,labs_height-.01])
    children();
}
