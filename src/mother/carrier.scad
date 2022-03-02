use <../lib/util.scad>;
include <common.scad>;

module carrier_body() {
    difference() {
        intersection() {
            scale([1.25,.55,.75])
            translate([0,0,saucer_width-carrier_height])
            sphere(d=2*saucer_width, $fn=02*faces_concave);

            union() {
                translate([-(carrier_front + carrier_back)/2+carrier_front,0,-carrier_height/2-carrier_hangar_offset*2])
                cube([carrier_front + carrier_back, carrier_width, carrier_height], center=true);
                
                translate([-(carrier_front + carrier_back)/2+carrier_front,0,-carrier_height/2])
                cube([carrier_front + carrier_back, carrier_width-carrier_hangar_offset*4, carrier_height], center=true);
                
                util_mirrored([0,1,0])
                translate([-(carrier_front + carrier_back)/2+carrier_front, carrier_width/2-2*carrier_hangar_offset,-2*carrier_hangar_offset])
                rotate([0,90,0])
                cylinder(r=carrier_hangar_offset*2, h=carrier_front+carrier_back, center=true, $fn=faces_convex);
            }
        }

        translate([-carrier_back,0,-carrier_hangar_height/2-carrier_hangar_offset])
        carrier_hangar_door();
        
        translate([carrier_front,0,-carrier_hangar_height/2-carrier_hangar_offset])
        carrier_hangar_door();
        
        translate([100,0,0])
        cylinder(d=scout_width-2, h=19, $fn=faces_concave, center=true);
        
        translate([-(200-carrier_hangar_height-2*carrier_hangar_offset),0,-200])
        rotate([90,0,0])
        cylinder(r=200-carrier_hangar_height-2*carrier_hangar_offset, h=200, $fn=faces_concave, center=true);

        translate([-(200-carrier_hangar_height-2*carrier_hangar_offset),0,-carrier_hangar_height-2*carrier_hangar_offset])
        translate([-250,0,-250])
        cube([500,200,500], center=true);
    }
    
    util_mirrored([0,1,0])
    translate([-350, 50,0])
    cylinder(h=14, r=20, $fn=faces_convex, center=true);

    translate([-350,0,0])
    cube([40, 100, 14], center=true);

    util_mirrored([0,1,0])
    translate([-350, 50, 7])
    scale([1,1,.4])
    sphere(d=20, $fn=faces_convex);
}



module carrier_saucer() {
    translate([100,0,-10])
    disk_class_2();
}

module carrier_hangar_door() {
    cube([5,carrier_hangar_width-2*carrier_hangar_offset, carrier_hangar_height], center=true);

    cube([5,carrier_hangar_width, carrier_hangar_height-2*carrier_hangar_offset], center=true);

    util_mirrored([0,1,0])
    util_mirrored([0,0,1])
    translate([0,carrier_hangar_width/2-carrier_hangar_offset, carrier_hangar_height/2 - carrier_hangar_offset])
    rotate([0,90,0])
    cylinder(h=5, r=carrier_hangar_offset, $fn=faces_concave, center=true);
}

module carrier_nacelle() {
    cube([200,30,30],center=true);

    difference() {
        union() {
            translate([150, 15,0])
            sphere(d=30, $fn=faces_convex);

            translate([-250, 15,0])
            sphere(d=30, $fn=faces_convex);

            translate([150, 15, -30])
            sphere(d=30, $fn=faces_convex);

            translate([-250, 15,-30])
            sphere(d=30, $fn=faces_convex);

            translate([-50,15,-15])
            cube([400,30,30],center=true);

            translate([-50,15,0])
            rotate([0,90,0])
            cylinder(d=30, h=400, $fn=faces_convex, center=true);

            translate([-50,15,-30])
            rotate([0,90,0])
            cylinder(d=30, h=400, $fn=faces_convex, center=true);

            translate([150,15,-15])
            cylinder(d=30, h=30, $fn=faces_convex, center=true);

            translate([-250,15,-15])
            cylinder(d=30, h=30, $fn=faces_convex, center=true);
        }

        translate([-50,30,-15])
        rotate([0,90,0])
        cylinder(d=5, h=400, $fn=faces_concave, center=true);

        translate([-50,0,-15])
        rotate([0,90,0])
        cylinder(d=5, h=400, $fn=faces_concave, center=true);
    }
}

module carrier_bar() {
    translate([0,0,warp_nacelle_height/2])
    difference() {
        union() {
            util_mirrored([1,0,0])
            translate([90,0,0])
            cylinder(d=20, h=warp_nacelle_height, $fn=faces_convex, center=true);

            cube([180,10,warp_nacelle_height], center=true);
        }

        util_mirrored([1,0,0])
        translate([25,0,0])
        rotate([90,0,0])
        cylinder(d=50, h=100, $fn=faces_concave, center=true);

        cube([50,100,50], center=true);
    }
}

module carrier() {
    carrier_saucer();
    carrier_body();
    carrier_assembly();
}

carrier();

module carrier_assembly() {
    util_mirrored([0,1,0])
    translate([-carrier_back/2, carrier_width/2-2*carrier_hangar_offset, -carrier_hangar_offset*2])
    rotate([-warp_theta,0,0]) {
        carrier_bar();

        translate([0,0,warp_nacelle_height]) 
        rotate([warp_theta,0,0])
        carrier_nacelle();
    }
}
