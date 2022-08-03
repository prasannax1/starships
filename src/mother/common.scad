use <../lib/util.scad>;

faces_rough=32;
faces_convex=64;
faces_concave=128;

saucer_width=750;
saucer_upper=600;
saucer_height=50;

labs_width=400;
labs_height=40;

command_width=180;
command_height=15;
command_body_width=50;
command_theta=75;

scout_width=100;
scout_height=15;
scout_theta=45;

bridge_width=32;
bridge_height=4;

warp_length=900;

hex_size=50;
carrier_width=250;
carrier_length=900;
hangar_height=80;
hangar_width=180;
carrier_theta=45;
carrier_ratio=.6;

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
    translate([0,0,1.5])
    cylinder(d2=scout_width, d1=scout_width-6, h=3, center=true, $fn=faces_convex);
    
    difference() {
        translate([0,0,4.5-.1])
        cylinder(d1=scout_width, d2=bridge_width+18, h=3, center=true, $fn=faces_convex);
        
        translate([scout_width/2-10,0,0])
        cube([scout_height*2, scout_width/6-4, 18], center=true);
    }
    
    difference() {
        translate([0,0,scout_height/2])
        cylinder(h=scout_height+.02, d1=scout_width-20, d2=bridge_width+10, $fn=faces_convex, center=true);
        
        
        translate([0,0,scout_height])
        cylinder(d2=bridge_width+18, d1=bridge_width-1, h=bridge_height*2, center=true, $fn=faces_concave);
    }
    
    translate([0,0,scout_height-bridge_height-.1])
    disk_0();
    
    translate([-3,0,0])
    disk_1_hangar();
    disk_1_impulse();
}

module disk_1_hangar() {
    difference() {
        intersection() {
            translate([scout_width/4,0,0])
            union() {
                translate([0,0,5])
                cube([scout_width/2, scout_width/6-6, 10], center=true);

                translate([0,0,3.5])
                cube([scout_width/2, scout_width/6, 7], center=true);

                util_mirrored([0,1,0])
                translate([0,scout_width/12-3, 10-3])
                rotate([0,90,0])
                cylinder(r=3, h=scout_width/2, center=true, $fn=faces_rough);
            }

            cylinder(h=2.5*scout_height, d1=scout_width+2*scout_height, d2=scout_width-2*scout_height, $fn=faces_convex, center=true);
        }
        
        translate([scout_width/2,0,0])
        cube([scout_height, scout_width/6-4, 18], center=true);
    }
}

module disk_1_impulse() {
    hull()
    util_mirrored([0,1,0])
    translate([0,scout_height/4,0])
    scale([1,3,1])
    translate([-scout_width/4, 0, scout_height/2])
    rotate([0,90,0])
    cylinder(h=scout_width/2, d=scout_height/2, center=true, $fn=6);
}


module disk_2(standalone=false) {
    disk_h = 6;
    disk_h2 = 3;
    
    if (standalone == false) {
        translate([0,0,disk_h+disk_h2-.01]) disk_1();
    }
    
    translate([0,0,disk_h/2])
    cylinder(d1=command_width, d2=command_width-2.5*disk_h, h=disk_h, $fn=faces_convex, center=true);
    
    translate([0,0,disk_h + (disk_h2+3)/2-.01])
    difference() {
        cylinder(d1=command_width-2.5*disk_h, d2=scout_width+6, h=disk_h2+3, $fn=faces_convex, center=true);
    
        translate([0,0,1.51])
        cylinder(d1=scout_width, d2=scout_width+6, h=3, center=true, $fn=faces_concave);
    }
    hull()
    util_mirrored([0,1,0])
    translate([-command_width*.44, 20, 5])
    scale([1,2,1])
    rotate([0,90,0])
    rotate(90)
    cylinder(h=command_width/8, d=10, $fn=6, center=true);
    
    translate([0,0,-3+.01])
    cylinder(d2=50, d1=bridge_width+4, h=6, $fn=faces_convex, center=true);
    
    translate([0,0,-6+.02])
    mirror([0,0,1]) disk_0();
}

module disk_3(show_hole=false) {
    difference() {
        union() {
            util_mirrored([0,0,1])
            translate([0,0,labs_height/4-.01])
            cylinder(d1=labs_width, d2=labs_width-labs_height*2, h=labs_height/2, center=true, $fn=faces_convex);
            
            translate([-labs_width*.35,0,0])
            linear_extrude(height=labs_height/2, convexity=10, scale=[.8,1])
            square([labs_width*.7, command_body_width], center=true);
        }
        
        if (show_hole == true) {
            cylinder(d=50, h=3*labs_height, center=true,$fn=faces_concave);
        }
    }
}    

module disk_4(show_holes=false) {
    difference() {
        hull() {
            translate([0,0,2])
            cylinder(h=4, d=saucer_width, $fn=faces_concave*2, center=true);
            
            translate([0,0,saucer_height/2])
            cylinder(h=saucer_height+.02, d=saucer_upper, $fn=faces_concave*2, center=true);
        }
        
        if (show_holes == true) {
            translate([0,0,saucer_height])
            cylinder(d2=labs_width+labs_height*2, d1=labs_width-labs_height*2, h=labs_height, center=true, $fn=faces_convex);
        }
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
    translate([-hangar_width/4,30,0]) 
    rotate([-carrier_theta,0,0]) 
    translate([0,0,hangar_width*carrier_ratio]) 
    rotate([carrier_theta,0,0])
    children();
}

module warp_pos() {
    warp_base_pos()
    warp_top_pos()
    translate([0,0,15-.01])
    children();
}

module scout_pos() {
    translate([25-.01,0,1.5]) 
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
    translate([0,0,labs_height/2-.05])
    children();
}

module escort_pos() {
    translate([-carrier_length/3, 0, 5-.02])
    children();
}