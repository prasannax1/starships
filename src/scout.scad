use <util.scad>;

module scout_dish() {
    difference() {
        util_saucer(100,50,10);
        translate([-60,0,0])
            cube([60,60,60], center=true);
    }
}

module scout_body() {
    difference() {
        scale([1,1,2])
            util_body(100,50,5,10);
        union() {
            translate([30,0,-10])
                scale([3,1,1])
                    rotate([90,0,0])
                        translate([0,0,-25])
                            cylinder(50,10,10);

            translate([40,0,-15])
                cube(30, center=true);

            translate([-50,0,-10])
                rotate([90,0,0])
                    translate([0,0,-25])
                        cylinder(50,10,10);
        }
    }    

    translate([-40,0,0])
        util_saucer(20,25,8);

    scale([1,1.25,.8])
        rotate([0,-90,0])
            cylinder(40,10,10);
}

module scout_nacelle_assembly() {
    translate([-35,0,0])
    util_nacelle_bar(45,10,10,2);
}

module scout_main() {
    scout_dish();
    scout_body();
    scout_nacelle_assembly();
}

module scout() {
    scale(.75) scout_main();
}

scout();
