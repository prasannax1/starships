use <util.scad>;

module mother() {
    color("grey")
    import("../stl/mother.stl", convexity=3);
}

module m_main_sep() {
    color("grey")
    import("../stl/ms_saucer_separate.stl", convexity=9);
}

module scout() {
    color("lightsteelblue")
    import("../stl/icp/scout.stl", convexity=3);
}

module attack() {
    color("darkred")
    import("../stl/attack.stl", convexity=3);
}

module science() {
    color("darkkhaki")
    import("../stl/science.stl", convexity=3);
}

module hospital() {
    color("olivedrab")
    import("../stl/macs/hospital.stl", convexity=3);
}

module diplomat() {
    color("thistle")
    import("../stl/diplomat.stl", convexity=3);
}

module tactical() {
    color("firebrick")
    import("../stl/tactical-runabout.stl", convexity=3);
}

module runabout() {
    color("goldenrod")
    import("../stl/icp/runabout.stl", convexity=3);
}

module macs_fast_shuttle() {
    color("cadetblue")
    import("../stl/macs/cutter.stl", convexity=3);
}

module macs_large_shuttle() {
    color("darkseagreen")
    import("../stl/macs/small-runabout.stl", convexity=3);
}

module macs_heavy_runabout() {
    color("rosybrown")
    import("../stl/macs/heavy-runabout.stl", convexity=3);
}

module macs_small_shuttle() {
    color("yellowgreen")
    import("../stl/macs/shuttle.stl", convexity=3);
}

module macs_pod() {
    color("palevioletred")
    import("../stl/macs/shuttlepod.stl", convexity=3);
}
