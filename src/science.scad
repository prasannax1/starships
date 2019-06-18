use <util.scad>;

module sci_saucer() {
    util_saucer(50,60,7.5);
    sci_bridge();
}

module sci_body() {
    difference() {
        util_body(50,60,5,10);
        sci_body_minus_1();
    }
}

module sci_nacelles() {
    translate([7.5,-22, -2.5])
        cube([10,44,.5]);
    util_mirrored([0,1,0])
        translate([18,20,-1.5])
            util_nacelle(60,5,5,curved=false, up=false);
}

module sci_bridge() {
    translate([0,0,4])
        scale([1.6,1.5,1])
            sphere(5);

    translate([0,0,4])
        scale([1,1.5,1])
            rotate([0,-90,0])
                cylinder(20,5,5);
    
    translate([-20,0,4])
        scale([1,1.5,1])
            sphere(5);
}

module sci_body_minus_1() {
    translate([25,0,-2])
        sphere(1.5, $fn=16);
    
    translate([-40,0,-31])
        cube(60, center=true);


    translate([-10,0,-6])
        scale([1.5,1,1])
            rotate([90,0,0])
                translate([0,0,-30])
                    cylinder(60,5,5);
}



module sci_main() {
    sci_saucer();
    sci_body();
    sci_nacelles();
}

module science_ship() {
    sci_main();
}

science_ship();