use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/fighter.scad>;
use <../lib/util.scad>;
use <../icp/tactical-runabout.scad>;
use <multilib.scad>;

module escort_shuttles(draw_ship=true) {
    if (draw_ship==true) {
        color("SlateGray")
        translate([750,0,0])
        mvm_escort_single();
    }

    color("IndianRed")
    translate([140,0,5])
    tactical();

    color("Chocolate")
    util_mirrored([0,1,0])
    repeat(2,tv=[0,18,0])
    translate([50,9,5])
    rotate(180)
    macs_fighter();
}

escort_shuttles();