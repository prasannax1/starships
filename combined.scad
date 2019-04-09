use <mother_ship.scad>;
use <attack_ship.scad>;
use <explorer_ship.scad>;
use <diplomatic_yacht.scad>;

translate([0,-400,100])
    mothership();
        
        
translate([-500,-400,400])
    rotate([0,0,180])
        explorer();
        
translate([400,-400,250])
    rotate([0,0,90])
        attack();

translate([0,400, 200])
    rotate([0,0,90])
        diplomat();