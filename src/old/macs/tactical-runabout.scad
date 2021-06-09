use <macs.scad>;

module macs_tactical_runabout() {
    translate([-4+.01-4,0,0]) macs_tactical_warp();
    translate([0,0,0]) macs_extra_room();
    translate([1.25-.01+4,0,0]) macs_pod();
    translate([-1.25-12+.01,0,0]) mirror([1,0,0])macs_pod_small();
}


macs_tactical_runabout();
