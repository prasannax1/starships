use <mother_ship.scad>;
use <attack_ship.scad>;
use <explorer.scad>;

translate([0,-400,100])
    mothership();
        
        
translate([-500,-400,400])
    rotate([0,0,-90])
        explorer();
        
translate([400,-400,250])
    rotate([0,0,90])
        attack();