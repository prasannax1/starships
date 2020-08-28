use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/fighter.scad>;
use <../lib/util.scad>;
use <../icp/tactical-runabout.scad>;
use <../icp/attack.scad>;
use <multilib.scad>;

module transwarp_ships() {
    color("SlateGray")
    mvm_transwarp();

    color("FireBrick")
    util_mirrored([0,1,0])
    repeat(2,tv=[0,0,20])
    translate([-75,25,65])
    rotate(180)
    attack();

    color("IndianRed")
    util_mirrored([0,1,0])
    translate([-300,-40,0])
    rotate(-7.5)
    repeat(2,[0,0,10])
    repeat(4,[30,0,0])
    translate([60,0,65])
    rotate(90)
    tactical();

    color("Chocolate")
    util_mirrored([0,1,0])
    repeat(4, tv=[0,0,5])
    repeat(5, tv=[20,0,0])
    translate([-120,70,65])
    rotate(-90)
    macs_fighter();

    color("Gold")
    util_mirrored([0,1,0])
    translate([-365,-30,0])
    rotate(-10)
    repeat(2,[0,8,0])
    repeat(4,[0,0,5])
    repeat(8,[6.4,0,0])
    translate([60,0,65])
    rotate(90)
    macs_pod();
}

transwarp_ships();

