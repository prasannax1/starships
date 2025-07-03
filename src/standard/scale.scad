/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <../unified/main.scad>;
use <constitution.scad>;
use <excelsior.scad>;
use <galaxy.scad>;
use <sovereign.scad>;
use <nx.scad>;
use <odyssey.scad>;

translate([-50,0,-150]) main();

translate([0,0,650]) nx();

translate([0,0,570]) constitution();

translate([-150,0,450]) excelsior();

translate([0,0,360]) galaxy();

translate([0,0,180]) sovereign();

translate([50,0,50]) odyssey();