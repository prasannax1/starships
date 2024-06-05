module main() {
    import("../../stls/generated/main.stl", 10);
}

module escort(carrier_attached = false) {
    import("../../stls/generated/escort.stl", 10);
}

module scout_simple() {
    import("../../stls/generated/scout_simple.stl", 10);
}

module scout_alt() {
    import("../../stls/generated/scout_alt.stl", 10);
}

module scout_full() {
    import("../../stls/generated/scout_full.stl", 10);
}

module command_simple() {
    import("../../stls/generated/command_simple.stl", 10);
}

module command_medium() {
    import("../../stls/generated/command_alt.stl", 10);
}

module command() {
    import("../../stls/generated/command_full.stl", 10);
}

module labs() {
    import("../../stls/generated/labs_full.stl", 10);
}

module carrier() {
    import("../../stls/generated/carrier.stl", 10);
}

module warp() {
    import("../../stls/generated/warp.stl", 10);
}

module saucer() {
    import("../../stls/generated/saucer.stl", 10);
}

translate([-0,0,-380]) main();

translate([0,0,550]) escort(carrier_attached=false);

translate([0,0,500]) scout_simple();
translate([-250,0,500]) scout_full();
translate([-450,0,500]) scout_alt();

translate([0,0,400]) command_simple();
translate([-320,0,400]) command_medium();
translate([-750,0,400]) command();

translate([0,0,275]) labs();

translate([0,0,140]) saucer();

translate([0,0,75]) carrier();

translate([0,0,-200]) warp();