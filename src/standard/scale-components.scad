module main() {
    import("d:/github/shareStuff/main.stl", 10);
}

module escort(carrier_attached = false) {
    import("d:/github/shareStuff/escort.stl", 10);
}

module scout_simple() {
    import("d:/github/shareStuff/scout_simple.stl", 10);
}

module scout_full() {
    import("d:/github/shareStuff/scout_full.stl", 10);
}

module command_simple() {
    import("d:/github/shareStuff/command_simple.stl", 10);
}

module command_medium() {
    import("d:/github/shareStuff/command_medium.stl", 10);
}

module command() {
    import("d:/github/shareStuff/command_full.stl", 10);
}

module labs() {
    import("d:/github/shareStuff/labs_medium.stl", 10);
}

module carrier() {
    import("d:/github/shareStuff/carrier.stl", 10);
}

module warp() {
    import("d:/github/shareStuff/warp.stl", 10);
}

module saucer() {
    import("d:/github/shareStuff/saucer.stl", 10);
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