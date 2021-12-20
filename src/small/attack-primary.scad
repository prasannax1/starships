use <../lib/util.scad>;


at_l=80;
at_w=40;
at_h=10;
at_faces=8;

module ap_inner_disk() {
    util_mirrored([0,0,1])
    translate([0,0,2.25-.01])
    cylinder(h=2.5, d1=32, d2=24, $fn=64, center=true);

    cylinder(h=1, d=32, $fn=64, center=true);
}

module ap_outer_disk() {
    util_mirrored([0,0,1])
    translate([0,0,2.5-.01])
    cylinder(h=2.25, d1=40, d2=30, $fn=64, center=true);

    cylinder(h=2.5, d=40, $fn=64, center=true);
}

module attack_primary(attached=true) {
    translate([0,0,0])
    difference() {
        scale([1,1,1])
        translate([0,0,-3])
        util_saucer_shape(32, 6, 1, 0, 1);

        cube([100,100,.5], center=true);
    }

    cylinder(center=true, h=1, d=27);

    //util_saucer_shape(15, 4, .5, 4, .5);


    translate([-20,0,0])
    difference() {
        scale([2.25,1,1])
        translate([0,0,-3])
        util_saucer_shape(40, 7,1,1,1);
        
        cube([200,12-.01,200],center=true);
        
        util_mirrored([1,0,0])
        util_mirrored([0,1,0])
        translate([32,0,0])
        rotate(30)
        translate([50,0,0])
        cube(100, center=true);
        
    }

    difference() {
        translate([-10,0,0])
        cube(20, center=true);

        util_mirrored([0,0,1])
        translate([-10,0,25+3])
        cube(50, center=true);
        
        if (attached==false) {
            translate([-20,0,0])
            hull()
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0,4.5,1.5])
            rotate([0,90,0])
            cylinder($fn=8, d=2, h=.5, center=true);
        }
    }

    difference() {
        translate([0,0,-3])
        scale([1,1,8/25])
        rotate([0,-90,0])
        translate([0,0,25])
        cylinder(h=48,d1=35, d2=30, center=true);

        cube([500,14,500], center=true);
        
        util_mirrored([0,1,0])
        translate([-53,0,0])
        rotate(30)
        translate([-50,0,0])
        cube(100, center=true);
        
        translate([0,0,-250-3])
        cube(500, center=true);
        
                //cube([500,500,.5], center=true);

    }
}

attack_primary(attached=false);


