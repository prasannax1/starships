use <../lib/util.scad>;

module science() {
    difference() {
        util_saucer(50,24,7.5);
        
        union() {
            cube([50,15,4], center=true);
            translate([0,0,1.5])
                cube([50,18,1], center=true);
            util_mirrored([1,0,0])
            translate([16,0,1.5])
            cube([15,24,1],center=true);
            translate([-20,0,6.8])
                scale([1.5,1,1.5])
                rotate([90,0,0])
                    cylinder(24,6,6,center=true,$fn=6);
//            translate([-14,0,-2])
//                rotate([90,0,0])
//                    cylinder(24,6,6,center=true,$fn=6);
            translate([22,0,4])
                rotate([0,-57,0])
                    cube([2,2,4], center=true);
//            util_mirrored([0,1,0])
//                translate([0,14,-.1])
//                    scale([1,1.5,1])
//                    rotate(90)
//                        rotate([90,0,0])
//                            cylinder(40,3,3,center=true,$fn=6);
        }
    }
}



science();