use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../lib/util.scad>;
use <multilib.scad>;

module scout_shuttles() {
    color("SlateGray")
    mvm_scout();

    color("Gold") {
        util_mirrored([0,1,0])
        repeat(1, tv=[0,5.4, 0])
        translate([-60,5.4,15])
        rotate(180)
        macs_pod();

        translate([-60,0,15])
        rotate(180)
        macs_pod();
    }

    color("Lime")
    util_mirrored([0,1,0])
    repeat(2, tv=[-5,0,0])
    translate([-72,-6,15])
    rotate(90)
    macs_pod_small();
}

scout_shuttles();