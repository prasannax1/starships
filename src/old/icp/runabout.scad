use <../lib/util.scad>;

module runabout() {
    difference() {
        union() {
            hull()
            util_mirrored([0,1,0])
            translate([0,2.7,0])
            util_ovoid(16,10,5,3.5,1.5, faces=10);
            
            util_ovoid(10,8,13,1.5,1,faces=10);
        }

        translate([-15/2-7,0,0])
        rotate([0,15,0])
        cube(15,center=true);
        
        translate([-15/2-.9,0,.9])
        rotate([0,5,0])
        cube([5,6.8,2.8], center=true);
    }
    
    util_mirrored([0,1,0])
    translate([0,-5.7,0])
    rotate([90,0,0])
    util_ovoid(7,7,1.2,1.5,1,faces=11);
}




runabout();
