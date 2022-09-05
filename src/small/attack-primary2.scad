use <../lib/util.scad>;

module att_disk() {
    difference() {
        intersection() {
            scale([1,1,7/16])
            sphere(d=36, $fn=128);

            translate([0,0,20])
            cube(40, center=true);
        }

        translate([0,0,2.4])
        rotate_extrude(angle=360, convexity=10, $fn=128)
        translate([18,0,0])
        square([2,.25], center=true);
        
        translate([0,0,20+4.8])
        cube(40, center=true);
    }
    
    difference() {
        intersection() {
            scale([1,1,7/16])
            rotate([0,-90,0])
            translate([0,0,9])
            cylinder(d=36, h=18, center=true, $fn=128);

            translate([0,0,20])
            cube(40, center=true);
        }

        translate([0,0,2.4])
        rotate_extrude(angle=360, convexity=10, $fn=128)
        translate([18,0,0])
        square([2,.25], center=true);
        
        translate([0,0,20+4.8])
        cube(40, center=true);
    }
}

att_disk();
