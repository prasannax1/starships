use <util.scad>;


difference() {
    util_mirrored([0,0,1])
        util_saucer(1000,1000,64);

    sphere(240);
    
    translate([300,0,0])
        cube([600,96,150],center=true);
}



difference() {

sphere(90);

translate([90,0,0])
sphere(20);
}

translate([-250,0,0])
rotate([0,90,0])
cylinder(500,45,45,center=true);

scale([1,1.5,.75]) {
translate([-500,0,0])
sphere(90);

translate([-550,0,0])
rotate([0,90,0])
cylinder(100,90,90, center=true);

translate([-600,0,0])
sphere(90);
}

util_mirrored([0,0,1])
util_mirrored([0,1,0])
translate([-550,0,0])
scale([3,1,1])
rotate([75,0,0]) {
cylinder(400,25,15);

translate([33,0,400])
util_nacelle(250,80,50,curved=true);
}