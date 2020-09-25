use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/fighter.scad>;
use <../macs/shuttle.scad>;
use <../lib/util.scad>;
use <multilib.scad>;

module command_shuttles(draw_ship=true) {
    if (draw_ship ==true) {
        color("SlateGray")
        mvm_command();
    }
    
    translate([50,0,0]){
        color("Chocolate")
        util_mirrored([0,1,0])
        repeat(3, tv=[18,0,0])
        translate([-215,-7.5,15]) 
        rotate(90) macs_fighter();

        color("Gold") {
            util_mirrored([0,1,0])
            repeat(3, tv=[0,5.4, 0])
            translate([-145,5.4,15])
            rotate(180)
            macs_pod();

            translate([-145,0,15])
            rotate(180)
            macs_pod();
        }

        color("Lime")
        util_mirrored([0,1,0])
        repeat(2, tv=[-5,0,0])
        repeat(2, tv=[0,-6,0])
        translate([-160,-9,15])
        rotate(90)
        macs_pod_small();
    }
}

command_shuttles();