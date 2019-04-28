use <mother_ship.scad>;

ms_disk();

ms_ball();

translate([0,45,0])
ms_ball();

rotate([-90,0,0])
cylinder(50,2,5, $fn=16);


difference() {
translate([0,50,0])
scale([2,3,1.1])
ms_ball();

ms_engine_minus();
}

module ms_engine_minus() {
    cube(90,center=true);
    
    translate([0,45,0])
        cube([100,100,1], center=true);
}

