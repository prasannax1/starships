use <../lib/util.scad>;
include <common.scad>;

module warp_saucer() {
    disk_1();

    translate([-scout_width/4, 0, scout_height/2])
    cube([scout_width/2, 20, scout_height*1.5], center=true);
}



module warp_body() {
    difference() {
        scale([1,1,1.5])
        rotate([0,90,0]) {
            util_mirrored([0,0,1])
            translate([0,0,warp_length/2])
            scale([1,1,1.5])
            sphere(d=scout_width, $fn=faces_convex);
            cylinder(d=scout_width, h=warp_length, $fn=faces_convex, center=true);
        }

        translate([0,0,1.5*scout_width/2])
        cube([1.5*warp_length, 1.5*scout_width, 1.5*scout_width], center=true);

        translate([warp_length/2-.75*scout_width, 0, -.75*scout_width-10])
        rotate([90,0,0])
        cylinder(r=.75*scout_width, h=1.5*scout_width, center=true, $fn=faces_concave);

        translate([-1.5*scout_width, 0, -.75*scout_width -10])
        cube([warp_length + 1.5*scout_width, 1.5*scout_width, 1.5*scout_width], center=true);
        
        translate([warp_length/2+scout_width*.7,0, -scout_width/4])
        rotate([0,90,0])
        cylinder(d1=20, d2=30, h=40, center=true, $fn=faces_concave);
    }

    translate([warp_length/2+scout_width*.5,0, -scout_width/4])
    rotate([0,90,0])
    cylinder(d=12.5, h=10, center=true, $fn=faces_rough);
}

module warp_nacelle_2() {
    nacelle(scout_width/2.2, scout_width/4, warp_length);
    
    translate([0,0,scout_width/8])
    rotate([0,90,0])
    translate([0,0,warp_length/2.8])
    cylinder(d=scout_width/1.5, h=warp_length/4, $fn=faces_convex, center=true);
}

module warp_nacelle() {
    translate([-scout_width/4,0,0])
        rotate([0,-90,0]) {
            translate([0,0,-warp_length/2])
            sphere(d=scout_width*.75, $fn=faces_convex);
            translate([0,0,-warp_length/4+.01])
            cylinder(d=scout_width*.75, h=warp_length/2, $fn=faces_convex, center=true);

            translate([0,0,warp_length/4-.01])
            cylinder(d1=scout_width*.75, d2=scout_width*.75*.5, h=warp_length/2, $fn=faces_convex, center=true);
        }


}

module warp_assembly() {
    util_mirrored([0,1,0])
    translate([-scout_width/2, scout_width/3+2, scout_width/2.5])
    //rotate([-30,0,0])
    warp_nacelle();

    util_mirrored([0,1,0])
    translate([0,scout_width/4,0])
    cube([warp_length/2, 20, 18], center=true);
}

module warp_sec_hull() {
    warp_body();
    warp_assembly();
    
    translate([-warp_length/4,0,-35/2-9+.01]) warp_hangar();
}

module warp_unpos() {
    translate([warp_length/2+scout_width/4,0,scout_height*.25-.01])
    warp_saucer();
    
    warp_sec_hull();
}

module warp_hangar() {
    mirror([0,0,1]) {
        difference() {
            hull()
            util_mirrored([1,0,0])
            translate([warp_length/4, 0, 0])
            cylinder(h=35, d1=scout_width, d2=scout_width*.5, center=true, $fn=faces_convex);

            util_mirrored([1,0,0])
            translate([scout_width/4 + warp_length/4 ,0,0])
            cube([scout_width/2, scout_width*1.5, 25], center=true);
        }

        util_mirrored([1,0,0])
        translate([warp_length/4, 0, 0])
        cylinder(h=34, d1=scout_width*.9, d2=scout_width*.5*.9, center=true, $fn=16);

        util_mirrored([1,0,0])
        translate([warp_length/4,0,35/2])
        disk_0();
    }
}

module warp() {
    translate([-warp_length/4,0,10-.01])
    warp_unpos();
}

warp();