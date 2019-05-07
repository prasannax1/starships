use <mother_ship.scad>;
use <mothership_saucer.scad>;

color("grey")
difference() {
    mothership();
    translate([0,0,10])
    rotate([0,0,90])
    mss_saucer_main();
}

color("white")
translate([0,0,100])
rotate([0,0,90])
mss_saucer_main();