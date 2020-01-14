use <../lib/util.scad>;
use <../mother/main.scad>;
use <../mother/separation.scad>;
use <../macs/macs.scad>;
use <../macs/shuttle.scad>;
use <../macs/runabout.scad>;
use <../macs/cutter.scad>;
use <../macs/heavy.scad>;
use <../icp/runabout.scad>;
use <../icp/science.scad>;
use <../icp/scout.scad>;
use <../icp/diplomatic.scad>;
use <../icp/attack.scad>;
use <../icp/tactical-runabout.scad>;
use <../macs/hospital.scad>;

use <perf.scad>;


m_main_sep();
translate([100,0,210]) scout();
translate([50,0,240]) hospital();
translate([-30,0,150]) science();
translate([30,0,150]) runabout();
translate([-30,0,180]) attack();
translate([30,0,180]) tactical();
translate([0,0,210]) diplomat();
translate([0,0,240]) macs_heavy_runabout();
translate([0,0,260]) macs_fast_shuttle();
translate([30,0,280]) macs_large_shuttle();
translate([0,0,280]) macs_small_shuttle();
translate([-30,0,280]) macs_pod();

