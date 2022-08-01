module main() {
    import("../../../shareStuff/main.stl", 10);
}

module escort(carrier_attached = false) {
    import("../../../shareStuff/escort.stl", 10);
}

module scout_simple() {
    import("../../../shareStuff/scout_simple.stl", 10);
}

module scout_full() {
    import("../../../shareStuff/scout_full.stl", 10);
}

module command_simple() {
    import("../../../shareStuff/command_simple.stl", 10);
}

module command_medium() {
    import("../../../shareStuff/command_medium.stl", 10);
}

module command() {
    import("../../../shareStuff/command_full.stl", 10);
}

module labs() {
    import("../../../shareStuff/labs_medium.stl", 10);
}

module carrier() {
    import("../../../shareStuff/carrier.stl", 10);
}

module warp() {
    import("../../../shareStuff/warp.stl", 10);
}

module saucer() {
    import("../../../shareStuff/saucer.stl", 10);
}

translate([-400,0,-500]) main();

translate([0,0,550]) escort(carrier_attached=false);

translate([0,0,500]) scout_simple();
translate([-250,0,500]) scout_full();

translate([0,0,400]) command_simple();
translate([-320,0,400]) command_medium();
translate([-750,0,400]) command();

translate([0,0,280]) labs();

translate([0,0,140]) saucer();

translate([0,0,0]) carrier();

translate([0,0,-250]) warp();