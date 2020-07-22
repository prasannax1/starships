use <../lib/util.scad>;
use <../mother/mlib.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/runabout.scad>;
use <../macs/cutter.scad>;
use <../macs/heavy.scad>;
use <../icp/runabout.scad>;
use <../icp/science.scad>;
use <../icp/attack.scad>;
use <../icp/diplomat.scad>;
use <../icp/explorer.scad>;
use <../icp/tactical-runabout.scad>;
use <../macs/hospital.scad>;

module c_mother() {
    color("grey")
    mother();
}

module c_m_main_sep() {
    color("grey")
    m_main_sep();
}

module c_scout() {
    color("lightsteelblue")
    explorer();
}

module c_attack() {
    color("darkred")
    attack();
}

module c_science() {
    color("darkkhaki")
    science();
}

module c_hospital() {
    color("olivedrab")
    hospital();
}

module c_diplomat() {
    color("thistle")
    scout();
}

module c_tactical() {
    color("firebrick")
    tactical();
}

module c_runabout() {
    color("goldenrod")
    runabout();
}

module c_macs_fast_shuttle() {
    color("cadetblue")
    macs_fast_shuttle();
}

module c_macs_large_shuttle() {
    color("darkseagreen")
    macs_large_shuttle();
}

module c_macs_heavy_runabout() {
    color("rosybrown")
    macs_heavy_runabout();
}

module c_macs_small_shuttle() {
    color("yellowgreen")
    macs_small_shuttle();
}

module c_macs_pod() {
    color("palevioletred")
    macs_pod();
}

module c_mvm_scout() {
    color("grey")
    mvm_scout();
}

module c_mvm_saucer() {
    color("grey")
    mvm_saucer();
}

module c_mvm_transwarp() {
    color("grey")
    mvm_transwarp();
}

module c_mvm_escort() {
    color("grey")
    mvm_escort();
}





