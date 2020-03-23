use <../lib/util.scad>;

module c_mother() {
    color("grey")
    import("../../stl/mother/main.stl", convexity=3);
}

module c_m_main_sep() {
    color("grey")
    import("../../stl/mother/separation.stl", convexity=9);
}

module c_scout() {
    color("lightsteelblue")
    import("../../stl/icp/scout.stl", convexity=3);
}

module c_attack() {
    color("darkred")
    import("../../stl/icp/attack.stl", convexity=3);
}

module c_science() {
    color("darkkhaki")
    import("../../stl/icp/science.stl", convexity=3);
}

module c_hospital() {
    color("olivedrab")
    import("../../stl/macs/hospital.stl", convexity=3);
}

module c_diplomat() {
    color("thistle")
    import("../../stl/icp/diplomat.stl", convexity=3);
}

module c_tactical() {
    color("firebrick")
    import("../../stl/icp/tactical-shuttle.stl", convexity=3);
}

module c_runabout() {
    color("goldenrod")
    import("../../stl/icp/runabout.stl", convexity=3);
}

module c_macs_fast_shuttle() {
    color("cadetblue")
    import("../../stl/macs/cutter.stl", convexity=3);
}

module c_macs_large_shuttle() {
    color("darkseagreen")
    import("../../stl/macs/small-runabout.stl", convexity=3);
}

module c_macs_heavy_runabout() {
    color("rosybrown")
    import("../../stl/macs/heavy-runabout.stl", convexity=3);
}

module c_macs_small_shuttle() {
    color("yellowgreen")
    import("../../stl/macs/shuttle.stl", convexity=3);
}

module c_macs_pod() {
    color("palevioletred")
    import("../../stl/macs/shuttlepod.stl", convexity=3);
}

module c_mvm_scout() {
    color("grey")
    import("../../stl/mother/scout.stl", convexity=3);
}

module c_mvm_saucer() {
    color("grey")
    import("../../stl/mother/saucer.stl", convexity=3);
}

module c_mvm_hangar() {
    color("grey")
    import("../../stl/mother/hangar.stl", convexity=3);
}

module c_mvm_transwarp() {
    color("grey")
    import("../../stl/mother/transwarp.stl", convexity=3);
}

module c_mvm_escort() {
    color("grey")
    import("../../stl/mother/escort.stl", convexity=3);
}

module c_mvm_starship() {
    color("grey")
    import("../../stl/mother/starship.stl", convexity=3);
}

module c_mvm_starbase() {
    color("grey")
    import("../../stl/mother/starbase.stl", convexity=3);
}



