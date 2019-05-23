use <mother_ship.scad>;
use <attack_ship.scad>;
use <explorer_ship.scad>;
use <diplomatic_yacht.scad>;
use <hospital.scad>;
        
module mother_a() {
    rotate(180) mothership();
}

module explorer_a() {
    translate([0,200,80]) rotate(90) explorer();
}

module attack_a() {
    translate([0,250,80]) attack();
}

module hospital_a() {
    translate([0,200,80]) hospital();
}

module diplomat_a() {
    translate([0,250,80]) rotate(90) diplomat();
}

module sector(num) {
    rotate(-num * 360/16) children();
}



mother_a();
sector(0) diplomat_a();
sector(1) hospital_a();
sector(2) explorer_a();
sector(3) explorer_a();
sector(5) explorer_a();
sector(6) explorer_a();
sector(7) attack_a();
sector(9) attack_a();
sector(10) explorer_a();
sector(11) explorer_a();
sector(13) explorer_a();
sector(14) explorer_a();