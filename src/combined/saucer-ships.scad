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
use <../macs/runabout.scad>;
use <../icp/tactical-runabout.scad>;
use <multilib.scad>;

module saucer_ships() {
    color("SlateGray")
    render()
    mvm_saucer();

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
    translate([100,0,75])
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

    color("SteelBlue")
    util_mirrored([0,1,0])
    rotate(162)
    repeat(2, rv=[0,0,3.5])
    repeat(3, tv=[0,0,6])
    repeat(5,tv=[11,0,0])
    translate([-345,0,75])
    rotate(-90)
    macs_large_shuttle();
}

saucer_ships();