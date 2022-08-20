use <../lib/util.scad>;

faces_rough=32;
faces_convex=64;
faces_concave=128;

saucer_width=750;
saucer_upper=600;
saucer_height=50;

labs_width=400;
labs_height=40;

command_width=200;
command_height=15;
command_body_width=60;
command_theta=75;
command_disk_h = 6;
command_disk_h2 = 3;

scout_width=100;
scout_height=15;
scout_theta=45;

bridge_width=18;
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
    rotate_extrude(angle=360, $fn=faces_convex) {
        translate([bridge_width/2-bridge_height,0,0])
        circle(r=bridge_height, $fn=7);

        translate([(bridge_width/2-bridge_height)/2,0,0])
        square([bridge_width/2-bridge_height, 6], center=true);
    }
}


module disk_1_upper_flat() {
    translate([0,-1.9,0])
    scale([(scout_width*.5)/(scout_height*2),1,])
    circle(r=scout_height, $fn=faces_concave);
}

module disk_1_lower_flat() {
    difference() {
        translate([0,-1.9,0])
        square([scout_width, scout_height*1.414], center=true);

        translate([0,-1.9,0])
        scale([(scout_width*.5)/(scout_height*2),1,1])
        rotate(45)
        translate([scout_height*3,0,0])
        circle(r=scout_height*2, $fn=faces_concave);
        
        translate([scout_width/2,0,0])
        rotate(-45)
        translate([scout_height/2,0,0])
        square(scout_height, center=true);
    }
}

module disk_1_flat_filter() {
    translate([scout_width/4, scout_height/2-3])
    square([scout_width/2, scout_height], center=true);
}

module disk_1_base() {
    translate([0,0,3-.01]) {
        rotate_extrude(angle=360, convexity=10, $fn=faces_convex)
        intersection() {
            union() {
                disk_1_upper_flat();
                disk_1_lower_flat();
            }

            disk_1_flat_filter();
        }

        difference() {
            intersection() {
                intersection() {
                    rotate([0,-90,0])
                    rotate(-90)
                    linear_extrude(height=scout_width*.4, convexity=10, scale=[.36,1])
                    util_mirrored([1,0,0])
                    intersection() {
                        disk_1_upper_flat();
                        disk_1_flat_filter();
                    }
                    
                    translate([0,0,-scout_width*.6+9])
                    cube(1.2*scout_width, center=true);
                }

                scale([1,1,.5])
                rotate([90,0,0])
                cylinder(d=scout_width*.8, h=scout_width, center=true, $fn=faces_concave);
            }

            translate([-scout_width*.4, 0, 3])
            cube([20,14,11],center=true);
        }

        intersection() {
            scale([1,1,.5])
                    rotate([90,0,0])
                    cylinder(d=scout_width*.8*.96, h=scout_width, center=true, $fn=faces_convex);

            translate([-scout_width/4,0,3])
            cube([scout_width/2, 14.5, 11.5], center=true);
        }

        intersection() {
            rotate([0,-90,0])
            rotate(-90)
            linear_extrude(height=scout_width/2, convexity=10, scale=[.25,1])
            util_mirrored([1,0,0])
            intersection() {
                disk_1_lower_flat();
                disk_1_flat_filter();
            }
            
            translate([0,0,-scout_width*.6+3])
            cube(1.2*scout_width, center=true);
        }
    }
}

module disk_1() {
    difference() {
        disk_1_base();        
        
        translate([0,0,scout_height])
        cylinder(d2=bridge_width+18, d1=bridge_width-1, h=bridge_height*2, center=true, $fn=faces_concave);
    }
    
    translate([0,0,scout_height-bridge_height-.1])
    disk_0();
}

module disk_2_flat() {
        difference() {
        translate([command_width/4, command_disk_h/2,0])
        square([command_width/2, command_disk_h], center=true);

        translate([command_width/2,0,0])
        rotate(45)
        translate([command_height,0,0])
        square(2*command_height, center=true);
    }

    difference() {
        translate([scout_width/2+1.5, (command_disk_h+2*command_disk_h2)/2, 0])
        square([3,command_disk_h+2*command_disk_h2], center=true);

        translate([scout_width/2+3, (command_disk_h+2*command_disk_h2), 0])
        rotate(45)
        translate([0,command_height/2,0])
        square(command_height, center=true);
    }

    translate([(scout_width/2+1)/2, (command_disk_h+command_disk_h2)/2, 0])
    square([scout_width/2+1, command_disk_h+command_disk_h2], center=true);
    
    intersection() {
        translate([0,-command_width*1.71,0])
        circle(d=2*command_width*1.805, $fn=faces_concave);
        
        difference() {
            translate([scout_width/2+3-.01,0,0])
            translate([(command_width/2-scout_width/2-3)/2, (command_disk_h+command_disk_h2*2)/2, 0])
            square([command_width/2-scout_width/2-3, command_disk_h+command_disk_h2*2], center=true);
            
            translate([command_width/2,0,0])
            rotate(45)
            translate([command_height,0,0])
            square(2*command_height, center=true);
        }
    }
}

module disk_2_basic() {
    rotate_extrude(angle=360, convexity=10, $fn=faces_convex) {
        disk_2_flat();
    }

    difference() {
        rotate([0,-90,0])
        rotate(-90)
        linear_extrude(height=command_width/2+command_height, convexity=10, scale=[.3,1])
        util_mirrored([1,0,0])
        difference() {
            disk_2_flat();
            translate([0, command_width/2+command_disk_h + command_disk_h2,0])
            square(command_width, center=true);
        }

        translate([-command_width/2-command_height,0,0])
        scale([4,1,1])
        rotate([90,0,0])
        cylinder(r=command_disk_h, h=command_width, $fn=faces_concave, center=true);
    }
}

module disk_2(standalone=false) {
    disk_h = 6;
    disk_h2 = 3;
    
    if (standalone == false) {
        translate([0,0,disk_h+disk_h2-.01]) disk_1();
    }
    
    disk_2_basic();
    
    translate([0,0,-3+.01])
    cylinder(d2=50, d1=bridge_width+10, h=6, $fn=faces_convex, center=true);
    
    translate([0,0,-6+.02])
    mirror([0,0,1]) disk_0();
}

module disk_3_flat() {
    difference() {
        translate([labs_width/4,0,0])
        square([labs_width/2, labs_height], center=true);

        translate([labs_width/2,0,0])
        rotate(-45)
        translate([labs_height,0,0])
        square(2*labs_height, center=true);
        
        translate([labs_width/2,0,0])
        rotate(75)
        translate([2*labs_height,0,0])
        square(4*labs_height, center=true);
    }
}

module disk_3_round() {
    rotate_extrude(angle=360, convexity=10, $fn=faces_convex)
    disk_3_flat();
}

module disk_3_straight(length) {
    rotate([0,-90,0])
    rotate(-90)
    linear_extrude(height=length, convexity=10)
    util_mirrored([10,0,0])
    disk_3_flat();
}

module disk_3_basic() {
    intersection() {
        union() {
            disk_3_round();
            disk_3_straight(labs_width/2+labs_height*2);
        }
        
        translate([-labs_width/2-labs_height,0,0])
        rotate([0,45,0])
        translate([labs_width,0,0])
        cube(2*labs_width, center=true);
    }
}

module disk_3(show_hole=false) {
    difference() {
        disk_3_basic();
        
        if (show_hole == true) {
            cylinder(d=50, h=3*labs_height, center=true,$fn=faces_concave);
        }
    }
}

module disk_4(show_holes=false) {
    difference() {
        hull() {
            translate([0,0,2])
            cylinder(h=4, d1=saucer_width,d2=saucer_width-8, $fn=faces_concave*2, center=true);
            
            translate([0,0,saucer_height/2])
            cylinder(h=saucer_height+.02, d=saucer_upper, $fn=faces_concave*2, center=true);
        }
        
        if (show_holes == true) {
            translate([0,0,saucer_height])
            disk_3_round();
        }
        
        translate([0,0,saucer_height+.1])
        disk_3_straight(saucer_width/2);
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
    translate([30-.01,0,1.5]) 
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