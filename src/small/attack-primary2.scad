use <../lib/util.scad>;


at_l=80;
at_w=40;
at_h=10;
at_faces=8;

translate([0,0,0])
difference() {
    scale([1,1,1])
    util_saucer_shape(32, 3, 1, 3, 1);

    cube([100,100,.5], center=true);
}

cylinder(center=true, h=1, d=30);

//util_saucer_shape(15, 4, .5, 4, .5);


translate([-20,0,0])
difference() {
    scale([2.25,1,1])
    util_saucer_shape(40, 4,1,4,1);
    
    cube([200,12,200],center=true);
    
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
    
    translate([-20,0,0])
    hull()
    util_mirrored([0,0,1])
    util_mirrored([0,1,0])
    translate([0,4.5,1.5])
    rotate([0,90,0])
    cylinder($fn=8, d=2, h=.5, center=true);
}

difference() {
    scale([1,1,6/25])
    rotate([0,-90,0])
    translate([0,0,25])
    cylinder(h=48,d1=35, d2=30, center=true);

    cube([500,14,500], center=true);
    
    util_mirrored([0,1,0])
    translate([-53,0,0])
    rotate(30)
    translate([-50,0,0])
    cube(100, center=true);
}



