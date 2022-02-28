/*
The other components in this file are STLs I downloaded
off the internet and scaled so that 1 pt = 1 meter.

Other files not included in source code.
*/

use <mother.scad>;
use <constitution.scad>;
use <excelsior.scad>;
use <galaxy.scad>;
use <sovereign.scad>;
use <nx.scad>;
use <odyssey.scad>;

translate([-400,0,-200]) mother();

translate([0,0,700]) nx();

translate([0,0,620]) constitution();

translate([0,0,500]) excelsior();

translate([0,0,360]) galaxy();

translate([0,0,180]) sovereign();

translate([0,0,50]) odyssey();