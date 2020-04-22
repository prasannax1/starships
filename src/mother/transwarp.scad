use <../lib/util.scad>;
use <common.scad>;

module mtw_main_body() {
    difference() {
        util_ovoid(220,320,240,80,120);

        translate([750/2,0,750/2])
        cube(750,center=true);

        translate([-750/2-160, 0, -(750/2)-10])
        cube(750, center=true);

        translate([0,0,80])
        rotate([90,0,0])
        cylinder(750,80,80,center=true);

        translate([-160,0,-125])
        scale([160/115,1,1])
        rotate([90,0,0])
        cylinder(750,115,115,center=true);
    }
}

mtw_main_body();

difference() {    
    translate([0,0,35-.01])
    scale([1, 40/160, 1])
    cylinder(70,200,180,center=true);


    translate([0,0,80])
    rotate([90,0,0])
    cylinder(750,80,80,center=true);

    translate([-750/2,0, 750/2])
    cube(750,center=true);
}

translate([180,0,70])
util_ovoid(180 ,180,360,30,10);

translate([180,0,100])
util_ovoid(20,40,40,4,4);








