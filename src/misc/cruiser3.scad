use <../lib/util.scad>;



module cruiser3_saucer() {
    translate([0,0,3.15-.01])
    cylinder(.3,60,59,center=true);

    cylinder(6,57,60,center=true);

    translate([0,0,-3.15+.01])
    cylinder(.3,56,57, center=true);


    util_mirrored([0,0,1])
    translate([0,0,3])
    cylinder(6,30,20,center=true);

    translate([0,0,6])
    scale([3,3,1])
    hull() {
        sphere(3);

        translate([-4,0,0])
        scale([1,1,2])sphere(1.5);
    }

    translate([0,0,-2.5])
    util_nacelle(100, 25,10, curved=true);

    mirror([0,0,1])
    util_saucer(32,32,10);

    translate([-30,0,-3])
    scale([5,1,1])
    rotate(45)
    cylinder(6,8,18,center=true, $fn=4);
}

module cruiser3_eng() {
    difference() {
    union() {
    difference() {
    scale([7,1,1])
    difference() {
        sphere(12);
        translate([20,0,0])
        cube(40,center=true);
    }



    translate([-20-60,0,0])
    cube(40,center=true);
    }

    translate([-60,0,0])
    sphere(8.35);


    util_mirrored([0,1,0])
    rotate([90,0,0])
    difference() {
    util_nacelle(74,12,15,curved=true);
            translate([20,0,0])
        cube(40,center=true);
    translate([-20-60,0,0])
    cube(40,center=true);
    }
    }



    scale([.15,1,1])
    sphere(10);

    translate([-60-8.35,0,-10])
    scale([2,1,1])
    rotate([90,0,0])
    cylinder(20,10,10,center=true);
    }
}



module cruiser3_manifold() {
util_mirrored([0,1,0])
translate([-95,0,-8])
rotate([-70,0,0]) 
translate([0,0,27])
{
cube([8,2,60], center=true);
util_mirrored([1,0,0])
translate([4,0,0])
cylinder(60,1,1,center=true, $fn=16);
}
}

module cruiser3_nacelle() {
difference() {
    union() {
translate([60,0,0]) sphere(6);
rotate([0,90,0])
cylinder(120,6,6,center=true);
    }

translate([-60-10,0,-10])
rotate([0,45,0])
cube(40,center=true);
}

util_mirrored([0,1,0])
rotate([-60,0,0])
translate([-18,0,4])
cube([32,1.5,8],center=true);
}

module cruiser3() {
cruiser3_saucer();
translate([-45,0,-8])
cruiser3_eng();
    cruiser3_manifold();
    
    util_mirrored([0,1,0])
    translate([-140,54,12])
    cruiser3_nacelle();
}

cruiser3();

