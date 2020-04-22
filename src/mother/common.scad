use <../lib/util.scad>;


module mvm_secondary_saucer() {
    util_saucer(500,180,40);
    util_saucer(500,360,15);
}

mvm_mtw_neck_common();

module mvm_mtw_neck_common() {
    translate([0,0,35-.01])
    scale([1, 40/160, 1])
    cylinder(70,200,185,center=true);
}