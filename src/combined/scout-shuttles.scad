use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../lib/util.scad>;
use <multilib.scad>;

module scout_shuttles(draw_ship=true) {
    if (draw_ship==true) {
        color("SlateGray")
        mvm_scout();
    }

    color("Gold") {
        util_mirrored([0,1,0])
        repeat(1, tv=[0,5.4, 0])
        translate([-60,5.4,10])
        rotate(180)
        macs_pod();

        translate([-60,0,10])
        rotate(180)
        macs_pod();
    }

    color("Lime")
    util_mirrored([0,1,0])
    repeat(2, tv=[-5,0,0])
    translate([-72,-6,10])
    rotate(90)
    macs_pod_small();
}

scout_shuttles();