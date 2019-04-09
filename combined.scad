use <mother_ship.scad>;
use <attack_ship.scad>;
use <explorer_ship.scad>;
use <diplomatic_yacht.scad>;

translate([0,-0,100])
    mothership();
        

rotate([0,0,360/16])       
translate([-225,-0,180])
    rotate([0,0,180])
        explorer();
        
translate([90,-400,120])
    rotate([0,0,0])
        attack();

translate([0,250, 180])
    rotate([0,0,90])
        diplomat();