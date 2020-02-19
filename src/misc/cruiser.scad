use <../lib/util.scad>;

translate([0,0,-2.5])
util_saucer(120,120,15);

util_saucer(45,45,18);

util_nacelle(75,30,20,curved=true);

difference() {
    translate([-54,0,0]) {
        mirror([0,0,1])
        util_saucer(75,36,15);
        
        translate([0,0,-2.5])
        util_saucer(100,36,12.5);
    }

    translate([-5,0,-6.5])
    rotate([0,-90,0])
    cylinder(40,5,1.5,center=true);

    translate([-90,0,-17])
    scale([2.5,1,1])
    rotate([90,0,0])
    cylinder(40,15,15,center=true);

    translate([-90-20,0,-22])
    cube(40,center=true);
}

util_mirrored([0,1,0])
translate([-90,0,0])
rotate([-70,0,0])
translate([0,0,27.5])
cube([12.5,2,55],center=true);

util_mirrored([0,1,0])
translate([-75,45,12.5])
util_nacelle(110,22,12.5,curved=true);