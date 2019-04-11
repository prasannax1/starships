module hos_ball() {
    sphere(20);
}

module hos_body() {
    difference() {
        union() {
            rotate([-90,0,0])
                cylinder(40,20,20);

            translate([0,40,0])
                scale([1,3,1])
                    sphere(20);
        }
        translate([-25,0,0])
            cube([50,180,30]);
        
    }
    
    scale([1,1,.2]) union() {
        rotate([-90,0,0])
            cylinder(40,20,20);

        translate([0,40,0])
            scale([1,3,1])
                sphere(20);
    }
}

//hos_body();
//hos_ball();

module hos_engineering() {
    hos_body();
    hos_pylon_assembly();
    mirror([1,0,0]) hos_pylon_assembly();
}

module hos_main() {
    hos_ball();
    hos_engineering();
}

module hos_pylon() {
    scale([1,2,1])
        rotate([-20,45,0])
            cube([2,2,25]);
}

module hos_pylon_assembly() {
    translate([10,30,0]) hos_pylon();
    translate([25,30,15]) hos_nacelle();
}

module hos_nacelle() {
    length = 60;
    scale([1.5,1,.75]) {
        rotate([-90,0,0])
            cylinder(length,2.5,2.5, $fn=16);

        sphere(2.5, $fn=16);

        translate([0,length,0])
            sphere(2.5, $fn=16);
    }
}

module hospital() {
    scale(1) hos_main();
}

hospital();