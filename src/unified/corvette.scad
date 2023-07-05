use <../lib/util.scad>;
use <disks.scad>;
use <engines.scad>;
include <common.scad>;
use <attack.scad>;
use <testbed.scad>;

module corvette() {
    translate([12.5,0,0])
    attack();
    proto_secondary();
}

corvette();