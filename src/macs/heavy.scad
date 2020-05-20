use <macs.scad>;



module macs_heavy_runabout() {
    union () {
        translate([-8,0,.5]) macs_large_warp();
        translate([4,0,.5]) macs_extra_room();
        translate([8+1.25,0,.5]) macs_pod();
        translate([-7.4+4,0,-1.8]) macs_double_box();
        //translate([-16-1.25,0,.5]) mirror([1,0,0]) macs_pod();
    }
}

macs_heavy_runabout();