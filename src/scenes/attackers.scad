use <../small/attack-primary.scad>;
use <../small/attack-secondary.scad>;
use <../small/fighter.scad>;
use <../small/shuttlepod.scad>;

translate([40,0,0])
rotate(0)
attack_secondary(attached=false);

translate([-35,0,-3.5])
rotate(0)
fighter();

translate([30,0,-.5])
rotate(0)
fighter();

rotate(-30) {
    translate([0,15,25])
    rotate(90)
    attack_primary(attached=false);

    translate([0,-7.5,24])
    rotate(-90)
    pod();
}