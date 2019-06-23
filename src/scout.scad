use <util.scad>;

module scout_dish() {
    difference() {
        util_saucer(80,40,10);
        translate([-60,0,0])
            rotate([0,30,0])
            cube([60,60,60], center=true);
    }
}

module scout_body() {
    difference() {
        scale([1,1,2])
            util_body(80,40,5,10);
        union() {
            translate([20,0,-10])
                scale([3,1,1])
                    rotate([90,0,0])
                        translate([0,0,-25])
                            cylinder(50,10,10);

            translate([45,0,-15])
                cube(60, center=true);


        }
    }    


}

module scout_nacelle_assembly() {
    translate([-30,0,-5])
        util_nacelle_bar(45,12,7.5,1);
  
    util_mirrored([0,1,0])
        translate([-25,20,5])
            util_nacelle(75,10,7.5);
}

module scout_main() {
    scout_dish();
    scout_body();
    scout_nacelle_assembly();
}

module scout() {
    scale(1) scout_main();
}

scout();
