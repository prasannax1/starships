use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/fighter.scad>;
use <../lib/util.scad>;
use <../icp/tactical-runabout.scad>;
use <../icp/attack.scad>;
use <multilib.scad>;
use <../macs/small-runabout.scad>;

module transwarp_ships(draw_ship=true) {
    if (draw_ship == true) {
        color("SlateGray")
        mvm_saucer_single();
    }

    color("SteelBlue")
    
    util_mirrored([0,1,0])
    repeat(8,tv=[11,0,0])
    translate([-330,30,90])
    rotate(-90)
    macs_large_shuttle();
}

transwarp_ships();

