use <../lib/util.scad>;

cylinder(8,52,60,center=true);

translate([0,0,4+1.5-.1])
cylinder(3,60,5,center=true);

translate([0,0,-4-1.5+.1])
cylinder(3,5,52,center=true);

scale([1,1,.75])
sphere(15);

util_nacelle(59,32,12,curved=true);


difference() {
translate([-70,0,-12])
scale([1,1.2,1])
rotate([0,90,0]) {
translate([0,0,30-.1])
cylinder(20,12.5,10,center=true);
cylinder(40,7.5,12.5,center=true);

translate([0,0,-20])
sphere(7.5);
}

translate([-30,0,-12])
scale([.2,1.2,1])
sphere(9);

translate([-90-7.5,0,-12.5-7.5-5])
scale([2.5,1,1])
rotate([90,0,0])
cylinder(40,12.5,12.5,center=true);
}


util_mirrored([0,1,0]) {
translate([-85,0,-9])
rotate([-70,0,0])
translate([0,0,27])
cube([10,2.5,56], center=true);

translate([-120,48,9])
rotate([0,90,0])
difference() {
union(){
cylinder(100,6,6,center=true);
translate([0,0,50])
sphere(6);
}

translate([12,0,-59])
rotate([0,45,0])
cube(40, center=true);
}
}