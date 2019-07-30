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

module macs_small_nacelle() {
    util_nacelle(7.5,1,1,curved=true, up=false);
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
            macs_small_nacelle();
    
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

module macs_large_nacelle() {
    util_nacelle(23,2.5,2.5,.5,curved=true,up=false);
}

module macs_large_warp(up=false) {
    macs_corridor(16);
    scale(1.5) macs_corridor(4);
    translate([0,0,.5]) {
        if(up) {
            util_nacelle_bar(25,2.5,2,.5);
        }
        else {
            mirror([0,0,1]) util_nacelle_bar(25,2.5,2,.5);
        };
    };
    
    if (up) {
        util_mirrored([0,1,0]) 
            translate([4,11,2.5]) 
                rotate([105,0,0])
                    macs_large_nacelle();
    } else {
        util_mirrored([0,1,0]) 
            translate([4,11,-2]) 
                rotate([75,0,0])
                    macs_large_nacelle();
    };
}

module macs_fast_shuttle() {
    union() {
        translate([1.25 + 8, 0, 0]) macs_pod();
        macs_large_warp();
    }
}


module macs_box() {
    scale([1,1.5,.5]) {
        rotate([0,90,0])
            rotate(180/8)
                cylinder(8,4,4, $fn=8, center=true);

        util_mirrored([1,0,0])
            translate([4,0,0])
                rotate([0,90,0])
                    rotate(180/8)
                        sphere(4, $fn=8);
    }
}



module macs_double_box() {
    union() {
        translate([-7,0,0]) macs_box();
        translate([7,0,0]) macs_box();
    }
}

module macs_heavy_runabout() {
    union () {
        translate([-8,0,.5]) macs_large_warp();
        translate([4,0,.5]) macs_extra_room();
        translate([8+1.25,0,.5]) macs_pod();
        translate([-7.4+4,0,-1.8]) macs_double_box();
        //translate([-16-1.25,0,.5]) mirror([1,0,0]) macs_pod();
    }
}

module macs_disk(radius) {
    util_hangar_form(radius*2,radius*2,2,4,3) union () {
        translate([0,0,2]) cylinder(0.25, radius, radius-.5, center=true);
        cylinder(3.5, radius, radius, center=true);
        translate([0,0,-2]) cylinder(0.25, radius-.5, radius, center=true);
    }
    cylinder(4.5, 3,3, center=true);
}

module macs_medevac() {
    translate([4,0,0]) union() {
        translate([0,0,.5]) macs_extra_room();
        translate([0,0,-1.95]) macs_disk(16);        
        translate([4+1.25, 0, .5]) macs_pod();
        translate([-12,0,.5]) macs_large_warp(up=true);
        translate([-21.25,0,.5]) mirror([1,0,0]) macs_pod();
    }
}

module macs_cargo_element() {
    rotate([0,90,0]) scale([1,1,2]) macs_disk(6);
}

module macs_large_cargo() {
    translate([28,0,0]) macs_cargo_element();
    translate([20,0,0]) macs_cargo_element();
    translate([12,0,0]) macs_cargo_element();
    translate([4,0,0]) macs_cargo_element();
    translate([-4,0,0]) macs_cargo_element();
    translate([-12,0,0]) macs_cargo_element();
    translate([-20,0,0]) macs_cargo_element();
    translate([-28,0,0]) macs_cargo_element();

    translate([20,0,0]) cylinder(6.6,3,3);
    translate([-20,0,0]) cylinder(6.6,3,3);
}

module macs_freighter() {
    translate([0,0,-2]) macs_large_cargo();
    translate([20,0,5]) macs_extra_room();
    translate([-4,0,5]) macs_extra_room();
    translate([-12,0,5]) macs_extra_room();
    translate([-20,0,5]) macs_extra_room();
    translate([8,0,5]) macs_large_warp();
    translate([25.25,0,5]) macs_pod();
}

