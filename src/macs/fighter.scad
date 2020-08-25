use <macs.scad>;

module macs_fighter() {
    translate([-4+.01,0,0]) macs_tactical_warp();
    translate([1.25-.01,0,0]) macs_pod_small();
}
macs_fighter();
