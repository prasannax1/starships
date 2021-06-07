use <../lib/util.scad>;

module attack_primary() {
    difference() {
        util_ovoid(25,25,25,6,.25,faces=9);

        translate([-5,0,0])
        rotate([0,-45,0])
        translate([-50,0,0])
        cube([100,7.8,100], center=true);
        
        translate([-15,0,0])
        rotate([0,-45,0])
        translate([-50,0,0])
        cube(100, center=true);
    }


    util_mirrored([0,1,0])
    translate([-10,7,3])
    scale([24,6,6])
    rotate([0,90,0])
    sphere(d=1, $fn=8);
}

attack_primary();

