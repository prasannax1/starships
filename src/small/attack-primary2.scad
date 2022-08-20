use <../lib/util.scad>;

difference() {
    intersection() {
        scale([1,1,6/16])
        sphere(d=36, $fn=128);

        translate([0,0,20])
        cube(40, center=true);
    }

    translate([0,0,2.5])
    rotate_extrude(angle=360, convexity=10, $fn=128)
    translate([18,0,0])
    square([5,.25], center=true);
    
    translate([0,0,20+5])
    cube(40, center=true);
}

