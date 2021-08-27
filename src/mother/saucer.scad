use <../lib/util.scad>;
include <common.scad>;

module saucer_saucer() {
    saucer_basic();
    translate([0,0,saucer_height]) disk_class_2();
}

module saucer_body() {
    difference() {
        intersection() {
            union() {
                body_pos() saucer_body_basic();

                translate([-saucer_width/2,0,0])
                scale([2*saucer_body_l/carrier_body_w,1,1])
                cylinder(
                    d=carrier_body_w, 
                    h=carrier_body_w/2+carrier_elevation+saucer_height,
                    center=true,
                    $fn=faces_convex);
            }

            cube(saucer_width+2, center=true);
        }

        translate([-saucer_width/5,0,-carrier_body_w/2+carrier_elevation+.01])
        scale([1,1,1])
        rotate([90,0,0])
        cylinder(
            r=carrier_body_w/2-carrier_elevation,
            h=carrier_body_w*2,
            center=true,
            $fn=faces_concave);

        translate([-saucer_width/5,0,+.01])
        translate([saucer_width/2,0,-saucer_width/2])
        cube(saucer_width, center=true);
        
        translate([0,0,carrier_elevation])
        rotate([0,90,0])
        cylinder(d1=140, d2=80, h=saucer_width*.77, center=true, $fn=faces_concave);
        
        translate([-saucer_width/2, 0, saucer_height-5])
        cube([20, 36, 8], center=true);
    }



    difference() {
        intersection() {
            translate([-saucer_width/2, 0, carrier_elevation])
            util_ovoid(saucer_body_l*.75, 2, carrier_body_w*.7, carrier_body_w*.35, carrier_body_w*.35, faces=faces_convex);

            translate([-saucer_width/3.5,0,0])
            translate([-saucer_width/2,0,0])
            cube(saucer_width, center=true);
        }

        translate([-saucer_width/3.5,0,carrier_elevation])
        scale([.25,1,1])
        sphere(d=60, $fn=faces_concave);
    }

    difference() {
        union() {
            cylinder(
                h=scout_height*2, 
                d=scout_width+20,
                center=true,
                $fn=faces_convex);

            translate([-saucer_width/4,0,0])
            cube([saucer_width/2, scout_width+20, scout_height*2], center=true);
        }

        union() {
            cylinder(
                h=scout_height*2.5, 
                d=scout_width,
                center=true,
                $fn=faces_concave);

            translate([-saucer_width/4,0,0])
            cube([saucer_width/2, scout_width, scout_height*2.5], center=true);
        }
    }
}

module saucer_nacelle() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([1,0,0])
    translate([75,0,10])
    sphere(d=20);
}

module saucer_assembly() {
    translate([-saucer_width/2.2,0, carrier_elevation])
    rotate([90,0,0])
    cylinder(d=25, h=2*carrier_body_w/1.75, center=true);

    util_mirrored([0,1,0])
    translate([-saucer_width/2.5,carrier_body_w/1.75, carrier_elevation]) saucer_nacelle();
}

module saucer() {
    saucer_saucer();
    saucer_body();
    saucer_assembly();
}

saucer();

