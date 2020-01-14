use <../lib/util.scad>;
use <../mother/main.scad>;
use <../mother/separation.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/runabout.scad>;
use <../macs/cutter.scad>;
use <../macs/heavy.scad>;
use <../icp/runabout.scad>;
use <../icp/science.scad>;
use <../icp/scout.scad>;
use <../icp/diplomatic.scad>;
use <../icp/attack.scad>;
use <../icp/tactical-runabout.scad>;
use <../macs/hospital.scad>;

use <perf.scad>;
        
module mother_a() {
    mother();
}

module science_a() {
    translate([0,270,64]) science_r();
}

module tactical_a() {
    translate([0,270,64]) tactical_r();
}

module xfer_a() {
    translate([0,250,64]) xfer_r();
}


module attack_a() {
    translate([0,450,-75]) attack_r();
}

module tug_a() {
    translate([0,220,64]) tug_r();
}

module hospital_a() {
    translate([0,450,-75]) hospital_r();
}

module diplomat_a() {
    translate([0,450,-75]) diplomat_r();
}

module scout_a() {
    translate([0,450,-75]) scout();
}

module sector(num) {
    rotate(-num * 360/16) children();
}

module repeat(n,shift) {
    shift_x = shift[0];
    shift_y = shift[1];
    shift_z = shift[2];
    
    for (i = [0: n-1])
        translate([shift_x * i, shift_y * i, shift_z * i])
            children();
}

module tactical_r() {
    util_mirrored([0,1,0])
    translate([-50,-20,0]) rotate(-360/32)
    repeat(5, [25,0,0])
    rotate(-90) tactical();
}

module tug_r() {
    
    repeat(4,[0,35,0])
    rotate(90) macs_fast_shuttle();
}

module xfer_r() {
    util_mirrored([0,1,0]) 
    translate([-67.5,-18,0])
    rotate(-360/32)
    repeat(10,[15,0,0])
    rotate(90) macs_large_shuttle();
}

module science_r() {
    util_mirrored([0,1,0])    
        translate([-37.5,-30,0]) rotate(-360/32)
            repeat(5, [20,0,0]) rotate(90) runabout();
    
    translate([-75,-12.5,0])
    repeat(2, [0,25,0]) science();
}


module diplomat_r() {
    rotate(90) diplomat();
    util_mirrored([1,0,0])
        translate([35,50,0])
            rotate(90) diplomat();
}

module hospital_r() {
    repeat(2, [0,60,0])
        rotate(90) hospital();
}

module attack_r() {
    rotate(90) attack();
        util_mirrored([1,0,0])
        translate([30,75,0])
            rotate(90) attack();
}


module combined() {
    mother_a();
    sector(0) diplomat_a();
    sector(1) hospital_a();
    sector(2) science_a();
    sector(3) science_a();
    sector(3) scout_a();
    sector(4) tug_a();
    sector(5) science_a();
    sector(5) scout_a();
    sector(6) science_a();
    sector(7) tactical_a();
    sector(7) attack_a();
    sector(8) tactical_a();
    sector(9) tactical_a();
    sector(9) attack_a();
    sector(10) science_a();
    sector(11) science_a();
    sector(11) scout_a();
    sector(13) science_a();
    sector(13) scout_a();
    sector(14) science_a();
    sector(15) xfer_a();
}

combined();


