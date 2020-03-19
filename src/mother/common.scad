use <../lib/util.scad>;


module mvm_secondary_saucer() {
    translate([-750/2,0,0]) {
        util_saucer(500,200,50);
    
        difference() {
            mirror([0,0,1])
            util_saucer(500,200,50);

            translate([0,0,-500-5])
            cube(1000,center=true);
        }
    }

    util_saucer(240,240,15);

    translate([0,0,-5+.01])
    cylinder(10,110,120,center=true);

    difference() {
        scale([1,2,1]) {
            translate([-(120+250)/2,0,0])
            rotate([0,90,0])
            cylinder(120+250,25,25,center=true);

            scale([2,1,1])
            sphere(25);
        }

        translate([0,0,-500-5])
        cube(1000,center=true);
    }
}




