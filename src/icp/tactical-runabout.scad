use <../lib/util.scad>;

module tactical() {
    difference() {
        union() {
            hull()
            util_mirrored([0,1,0])
            translate([0,2.7,0])
            util_ovoid(16,10,5,3.5,1.5, faces=10);
            
            translate([-3,0,0])
            util_ovoid(12,4,20,1.2,1,faces=13);
            
        }

        translate([-25/2-7,0,0])
        rotate([0,15,0])
        cube(25,center=true);
        
        translate([-15/2-.9,0,.9])
        rotate([0,5,0])
        cube([5,6.8,2.8], center=true);
    }
    
    util_mirrored([0,1,0])
    translate([1.5,8,0])
    rotate([90,0,0])
    mirror([1,0,0])
    util_ovoid(18,4,3,1.2,2.8,faces=7);
    
}




tactical();

