use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../lib/util.scad>;
use <../icp/attack.scad>;
use <../icp/science.scad>;
use <../icp/explorer.scad>;
use <../icp/diplomat.scad>;
use <../icp/yacht.scad>;
use <../icp/runabout.scad>;
use <../macs/small-runabout.scad>;
use <../icp/tactical-runabout.scad>;
use <../macs/fighter.scad>;
use <multilib.scad>;

module saucer_ships(draw_ship=true) {
    if (draw_ship==true) {
        color("SlateGray")
        render()
        mvm_carrier_single();
    }

    //color("Firebrick")
    ////util_mirrored([0,1,0])
    //rotate(60)
    //translate([-300,0,75])
    //attack();


    color("Goldenrod")
    util_mirrored([0,1,0])
    rotate(70)
    repeat(2, rv=[0,0,10])
    repeat(2, tv=[-60,0,0])
    translate([-280,0,75])
    science();

    color("Goldenrod")
    util_mirrored([0,1,0])
    rotate(110)
    repeat(3, rv=[0,0,10])
    //repeat(2, tv=[60,0,0])
    translate([-340,0,75])
    science();

    color("Aquamarine")
    util_mirrored([0,1,0])
    rotate(100)
    translate([-280,0,75])
    explorer();

    color("Aquamarine")
    util_mirrored([0,1,0])
    rotate(-60)
    translate([-280,0,75])
    explorer();

    color("DarkOrchid")
    util_mirrored([0,1,0])
    rotate(90)
    translate([-300,0,75])
    diplomat();

    color("IndianRed")
    util_mirrored([0,1,0])
    repeat(2,tv=[0,0,10])
    repeat(5,tv=[30,0,0])
    translate([-300,25,0])
    rotate(90)
    translate([75,0,75])
    tactical();

    color("LightCyan")
    util_mirrored([0,1,0])
    rotate(110)
    repeat(3, rv=[0,0,10])
    translate([-260,0,75])
    yacht();

    color("OliveDrab")
    util_mirrored([0,1,0])
    rotate(140)
    repeat(5,rv=[0,0,4])
    repeat(2,tv=[0,0,10])
    repeat(2,tv=[30,0,0])
    translate([-340,0,75])
    runabout();


    
    translate([-400,0,0]) {
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

}

saucer_ships();