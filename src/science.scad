use <util.scad>;

module sci_saucer() {
    translate([0,0,2])
        util_hangar_disk(1,20,19,4);
    util_hangar_disk(3,20,20,4);
    translate([0,0,-2])
        util_hangar_disk(1,19,20,4);
    
    translate([0,0,-.5])
    cylinder(5,10,10,center=true);
}

module sci_body() {
    difference() {
        union() {
            translate([-16,0,2]) intersection() {
                translate([-65,0,0])
                    util_saucer(200,30,10);

                scale([1,1,.5])
                    rotate([0,90,0])
                        rotate(30)
                            cylinder(70,8,8,$fn=6,center=true);
            }

            translate([-25,0,0])
                cube([50,16,4], center=true);
        }

        translate([-55,0,10])
            rotate([0,20,0])
                cube(50,center=true);

        translate([-61,0,10])
            rotate([0,-20,0])
                cube(50,center=true);
    }
}

module sci_nacelle_assembly() {
    translate([-27,0,3.5])
        mirror([0,0,1])
            util_nacelle_bar(48,9,5,1.5);

    util_mirrored([0,1,0]) translate([-10,22,-5]) {
        util_nacelle(40,7.5,5,up=false,curved=true);
        util_nacelle(40,7.5,.75,up=true, curved=true);
    }
}

module sci_sensors() {
    translate([-20,0,5])
    util_saucer(18,18,3);
}


module sci_main() {
    sci_saucer();
    sci_body();
    sci_nacelle_assembly();
    sci_sensors();
}

module science() {
    scale(1) sci_main();
}

module sci_msd() {
    projection(cut=true)
    rotate([-90,0,0])
    union() {
        sci_saucer();
        sci_body();
        sci_sensors();
        translate([-10,0,-5]) {
            util_nacelle(40,7.5,5,up=false,curved=true);
            util_nacelle(40,7.5,.75,up=true, curved=true);
        }
    }
}

science();

//sci_msd();