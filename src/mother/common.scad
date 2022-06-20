use <../lib/util.scad>;

faces_rough=32;
faces_convex=64;
faces_concave=100;

saucer_width=750;
saucer_upper=640;
saucer_height=50;

labs_width=400;
labs_height=30;

command_width=180;
command_height=20;
command_theta=75;

scout_width=100;
scout_height=10;
scout_theta=45;

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

module disk_1() {
    difference() {
        semi(scout_width, scout_height, faces_convex);
        
        translate([0,0,scout_height-bridge_height/2])
        cylinder(d1=bridge_width, d2=bridge_width*1.1, h=bridge_height, $fn=faces_concave, center=true);
        
        translate([-scout_width/2,0,0])
        cube([50, 12-.02, 30], center=true);
        
        
        translate([scout_width/2,0,.5*.75*scout_height])
        cube([7.5,18,6.4], center=true);
    }
    
    translate([0,0,scout_height-bridge_height-.01])
    disk_0();
    
    util_mirrored([0,1,0])
    translate([-scout_width/4, 12, 3.6])
    scale([1,2,1])
    rotate([0,90,0])
    rotate(90)
    cylinder(d=6, h=scout_width/2, $fn=6, center=true);
    
    difference() {
        intersection() {
            scale([1,1,.4])
            sphere(d=scout_width, $fn=faces_concave);

            scale([1,1,.75])
            rotate([0,90,0])
            cylinder(d=30, h=scout_width, $fn=faces_convex, center=true);

            translate([scout_width/2,0,.5*.75*scout_height])
            cube([scout_width, 25, .75*scout_height], center=true);
        }
        
        translate([scout_width/2,0,.5*.75*scout_height])
        cube([7.5,18,6.4], center=true);
    }
}



module disk_2() {
    disk_h = 10;
    
    translate([0,0,disk_h-.01]) disk_1();
    
    translate([0,0,disk_h/2])
    cylinder(d1=command_width, d2=command_width-2*disk_h, h=disk_h, $fn=faces_convex, center=true);
    
    hull()
    util_mirrored([0,1,0])
    translate([-command_width/4, 20, 5])
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
    hull() {
        translate([0,0,2])
        cylinder(h=4, d=saucer_width, $fn=faces_concave*2, center=true);
        
        translate([0,0,saucer_height/2])
        cylinder(h=saucer_height+.02, d=saucer_upper, $fn=faces_concave*2, center=true);
    }
    
    
    translate([0,0, -15+.01])
    cylinder(d2=hangar_width, d1=(150+scout_width)/2, $fn=faces_convex, h=30, center=true);
    
    translate([0,0,-30+.01])
    mirror([0,0,1])
    disk_0();
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

module command_pos_1() {
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

module escort_pos() {
    translate([-carrier_length/3, 0, 5-.02])
    children();
}