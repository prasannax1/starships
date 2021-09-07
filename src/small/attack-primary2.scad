use <../lib/util.scad>;


at_l=80;
at_w=40;
at_h=10;
at_faces=8;

hull() {
    difference() {
        util_mirrored([0,1,0])
        translate([at_l/4,at_w/8,0])
        scale([4,1,2])
        rotate([0,90,0])
        sphere(d=at_h, $fn=at_faces);
        
        translate([0,0,-500])
        cube(1000, center=true);
    }

    util_mirrored([0,1,0])
    translate([-at_l/8,at_w/2,at_h/2])
    scale([4,1,1])
    rotate([0,90,0])
    sphere(d=at_h, $fn=at_faces);
}