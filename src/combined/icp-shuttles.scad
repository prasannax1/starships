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

module icp_shuttles() {
    translate([0,125,0]) {
        translate([-4,0,5]) rotate(180) color("White") macs_pod_small();
        color("Grey") runabout();
    }
    
    translate([0,100,0]) {
        translate([-4,0,5]) rotate(180) color("White") macs_pod_small();
        color("Grey") tactical();
    }
    
    translate([0,50,0]) {
       translate([-12,0,6]) rotate(180) color("White") macs_pod_small();
        color("Grey") yacht();
    }
    
    translate([0,-0,0]) {
        repeat(3,tv=[0,-6,0])
        translate([-1,6,11]) rotate(180) color("White") macs_pod_small();
        color("Grey") science();
    }
    
    translate([0,-50,0]) {
        repeat(3,tv=[0,-6,0])
        translate([-1,6,11]) rotate(180) color("White") macs_pod_small();
        color("Grey") attack();
    }
    
    translate([0,-100,0]) {
        util_mirrored([0,1,0])
        translate([-10,3,11]) rotate(180) color("White") macs_pod();
        color("Grey") diplomat();
    }
    
    translate([0, -150,0]) {
        util_mirrored([0,1,0])
        repeat(2, tv=[-6.4,0,0])
        translate([-10,6.4,11]) rotate(-90) color("White") macs_pod();
        color("Grey") explorer();
    }
}

rotate(90)
icp_shuttles();