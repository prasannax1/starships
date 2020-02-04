use <../lib/util.scad>;


module mvm_escort() {
    difference() {
        mirror([0,0,1])
            util_saucer(200,200,25);

        util_mirrored([0,1,0]) {
            translate([0,66,25/2-3])
                cube([200,2,25],center=true);

            translate([0,66,-25])
                cube([200,2,25],center=true);

            translate([100,66,0])
                cube([100,2,100],center=true);

            translate([-66,66,0])
                cube([100,2,100],center=true);

            translate([110,66+50,-20])
                rotate([0,45,0])
                    cube(100, center=true);
        }

        translate([100,0,0])
            rotate([0,-15,0])
                cube([25,40,100],center=true);

        translate([-100,0,0])
            cube(133, center=true);
    }
}

mvm_escort();
