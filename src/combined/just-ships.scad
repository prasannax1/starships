use <multilib.scad>;
use <saucer-ships.scad>;
use <scout-shuttles.scad>;
use <escort-shuttles.scad>;
use <command-shuttles.scad>;
use <transwarp-ships.scad>;

module just_ships(draw_ship=false) {
    
    saucer_ships(draw_ship);
    translate([-375+.01,0,-0+.01]) transwarp_ships(draw_ship);
    translate([0,0,150]) command_shuttles(draw_ship);
    translate([0,0,-75]) scout_shuttles(draw_ship);
    translate([-375,0,-150]) escort_shuttles(draw_ship);
    
}

just_ships(draw_ship=false);