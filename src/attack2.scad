use <util.scad>;

cylinder(2,20,15);
mirror([0,0,1])
cylinder(2,20,19);

difference() {
translate([-20,0,0])
mirror([0,0,1])
util_saucer(80,20,6);
    
    translate([-65,0,0])
    cube(100,center=true);
    
        translate([68,0,0])
    cube(100,center=true);
}

translate([-15,0,0]) {
mirror([0,0,1])
util_saucer(20,20,6);


util_saucer(20,20,2);
}

translate([5,0,0])
util_nacelle(25,20,3,curved=true);

util_mirrored([0,1,0])
translate([-15,10,-5])
rotate([60,0,0])
util_nacelle(35,5,12,curved=true,up=false);