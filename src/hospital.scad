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
        difference() {
            mirror([0,0,1])
                util_saucer(60,24,18);
    
            translate([-20,0,-7.5])
                cube(40,center=true);
        }
    
    
        difference() {
            scale([1,1,6])
                util_body(60,24,3,15);
    
            translate([20,0,-7.5])
                cube(40,center=true);
        }

        scale([1,1,.1])
            util_saucer(60,24,18);
    }
}

module hos_nacelle_assembly() {
    translate([-15,0,-5])
        mirror([0,0,1])
            util_nacelle_bar(40,5,5,1);
}

module hos_body_minus() {
    translate([-2,0,-7.5])
        sphere(2.5, $fn=16);

    translate([-65,0,-25])
        rotate([0,45,0])
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

hospital();
