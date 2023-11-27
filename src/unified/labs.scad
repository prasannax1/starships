use <disks.scad>
use <reverse_yacht_small.scad>;

module labs() {
    disk_3();
    
    translate([0,0,.3])
    reverse_yacht_small();
}

labs();