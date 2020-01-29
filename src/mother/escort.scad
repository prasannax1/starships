use <../lib/util.scad>;


module mvm_escort() {
    difference() {
        mirror([0,0,1])
            util_saucer(240,240,20);

        util_mirrored([0,1,0]) {
            translate([0,75,25/2-3])
                cube([200,2,25],center=true);

            translate([0,75,-27])
                cube([200,2,25],center=true);

            translate([100,75,0])
                cube([100,2,100],center=true);

            translate([-75,75,0])
                cube([100,2,100],center=true);

            translate([120,75+50,-20])
                rotate([0,45,0])
                    cube(100, center=true);
        }

        translate([120,0,0])
            rotate([0,-15,0])
                cube([25,40,100],center=true);

        translate([-120,0,0])
            cube(150, center=true);
    }
}

mvm_escort();
