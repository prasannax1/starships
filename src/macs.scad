use <util.scad>;



module macs_pod_diff() {
    translate([0,0,-(6+.5)])
        cube(12, center=true);

    translate([-(3+1.25),0,0])
        cube(6, center=true);
}

module macs_pod() {
    difference() {
        scale([1,.4,.35])
            rotate(90)
                sphere(6, $fn=6);
        macs_pod_diff();
    }
    
    //macs_pod_wing();
}



module macs_pod_wing() {
    translate([-1,0,0])
        rotate([0,90,0])
            scale([.1,1,1])
                cylinder(2, 3.5, 2.75, $fn=6);
}

module macs_small_warp() {
    macs_corridor(4);

    translate([0,0,1.5])
        mirror([0,0,1])
            scale([1,1.2,0.8])
                util_nacelle_bar(7.5,2,2,.15);

    util_mirrored([0,1,0])
        translate([3,4.2,0])
            util_nacelle(7.5,1,1,curved=true, up=false);
    
    translate([0,0,1.5])
        rotate([0,90,0]) {
            translate([0,0,1.5]) sphere(.5, $fn=8);
            cylinder(3,.5,.5, center=true, $fn=8);
            translate([0,0,-1.5]) sphere(.5, $fn=8);
        }
}


module macs_small_shuttle() {
    union() {
        translate([1.25,0,0]) macs_pod();
        translate([-2,0,0]) macs_small_warp();
    }
}

module macs_extra_room() {
     macs_corridor(8);

     difference() {
         scale([1,1,.5])
            sphere(4, $fn=6);


        translate([0,0,-(6+.5)])
            cube(12, center=true);
    }
}

module macs_large_shuttle() {
    union() {
        translate([1.25 + 4, 0, 0]) macs_pod();
        macs_extra_room();
        translate([-2 - 4, 0, 0]) macs_small_warp();
    }
}

module macs_corridor(length) {
    difference() {
        scale([1,1,.9])
            rotate([0,-90,0])
                rotate(90)
                    cylinder(length,2,2,$fn=6, center=true);
        translate([0,0,-(length*1.1/2 +.5)])
            cube(length*1.1, center=true);
    }
}

module macs_large_warp() {
    macs_corridor(16);
    scale(1.5) macs_corridor(4);
    translate([0,0,.5]) mirror([0,0,1]) util_nacelle_bar(25,2.5,2,.5);
    util_mirrored([0,1,0]) 
        translate([4,11,-1.75]) 
            rotate([75,0,0])
            util_nacelle(20,2.5,2.5,.5,curved=true,up=false);
}

module macs_fast_shuttle() {
    union() {
        translate([1.25 + 8, 0, 0]) macs_pod();
        macs_large_warp();
    }
}

macs_fast_shuttle();

