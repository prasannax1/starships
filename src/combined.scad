use <mother_ship.scad>;
use <attack_ship.scad>;
use <explorer_ship.scad>;
use <diplomatic_yacht.scad>;

translate([0,-0,0])
    mothership();
        

rotate([0,0,360/16])       
translate([-225,-0,80])
    rotate([0,0,180])
        explorer();
        
translate([90,-400,20])
    rotate([0,0,0])
        attack();

translate([0,250, 80])
    rotate([0,0,90])
        diplomat();