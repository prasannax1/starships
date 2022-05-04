use <../lib/util.scad>;

faces_rough=32;
faces_convex=64;
faces_concave=100;

saucer_width=750;
saucer_height=50;

labs_width=350;
labs_height=25;

command_width=200;
command_height=15;

scout_width=100;
scout_height=7;

bridge_width=32;
bridge_height=4;

warp_length=900;

hex_size=50;
carrier_width=250;
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

module disk_0() {
    disk(bridge_width, bridge_height, faces_rough, 2.8);
}

module disk_1() {
    translate([0,0,scout_height]) disk_0();    
    
    disk(scout_width, scout_height, faces_convex);
    
    mirror([0,0,1]) disk_0();
}


module disk_2() {
    translate([0,0,command_height+scout_height]) disk_0();
    translate([0,0,command_height]) 
    disk(scout_width, scout_height, faces_convex, 3.5);
    
    disk(command_width, command_height, faces_convex,3);
    
    mirror([0,0,1]) disk_0();
}

module disk_3(show_hole=true) {
    difference() {
        disk(labs_width, labs_height, faces_convex, 3);
        
        if (show_hole == true) {
            cylinder(h=labs_height*5, d=(command_width+scout_width)/2, center=true, $fn=faces_concave);
        }
    }
}    

module disk_4() {
    disk(saucer_width, saucer_height, faces_concave, 4);
    
    mirror([0,0,1])
    disk(labs_width, labs_height, faces_convex, 3);
    
    translate([0,0,-labs_height])
    mirror([0,0,1])
    disk(command_width, command_height, faces_convex,3);
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

module warp_pos(theta) {
    translate([-carrier_width+62, hangar_width/2,0])
    translate([0,0,15-.01])
    translate([0,30,0])
    rotate([-theta,0,0])
    translate([0,0,hangar_width])
    rotate([theta,0,0])
    children();
}

module saucer_pos() {
    translate([2.75*carrier_width,0,10+30-.01])
    children();
}