use <util.scad>;

module hos_saucer() {
    util_hangar_disk(3,20,20,4);
    translate([0,0,2])
        util_hangar_disk(1,20,18,4);
    translate([0,0,-2])
        util_hangar_disk(1,18,20,4);
    cylinder(5.5,10,10,center=true);
    cylinder(6,7.5,7.5,center=true);
}

module hos_body_1() {
    translate([-30,0,-1.5])union() { 
        mirror([0,0,1])
            util_saucer(60,24,18);

        scale([1,1,.1])
            util_saucer(60,24,18);
    }
}

module hos_nacelle_assembly() {
    translate([-15,0,-5])
        mirror([0,0,1])
            util_nacelle_bar(40,5,5,1);
    
    util_mirrored([0,1,0])
        translate([-10,18,-9])
            util_nacelle(40,6,6,curved=true,up=false);
}

module hos_body_minus() {
    translate([-2,0,-7.5])
        sphere(2.5, $fn=16);

    translate([-50,0,-30])
        rotate([0,20,0])
            cube(30, center=true);
}

module hos_body() {
    difference() {
        hos_body_1();
        hos_body_minus();
    }
}

module hos_main() {
    hos_saucer();
    hos_body();
    hos_nacelle_assembly();
}

module hospital() {
    scale(1) hos_main();
}

module hos_msd() {
    projection(cut=true) rotate([-90,0,0]) union() {
        hos_saucer();
        hos_body();
        translate([-10,0,-22]) util_nacelle(40,6,6,curved=true,up=false);
    }
}

hospital();

//hos_msd();