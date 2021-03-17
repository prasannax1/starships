use <../lib/util.scad>;
include <carrier_lib.scad>;
include <escort_lib.scad>;
module escort() {
    difference() {
        hull() { 
            util_ovoid(esc_disk_f, esc_disk_b, esc_disk_width, esc_disk_up_ext, esc_disk_down_ext);
            
            translate([-esc_disk_b/2,0,0])
            scale([1,2,.66])
            rotate([0,90,0])
            rotate(180/20)
            cylinder(r=esc_disk_up_ext, h=esc_disk_b, center=true, $fn=20);
        }

        translate([0,0,1.5*esc_disk_width/2 + esc_disk_up])
        cube(esc_disk_width*1.5, center=true);

        translate([0,0,-1.5*esc_disk_width/2 - esc_disk_down])
        cube(esc_disk_width*1.5, center=true);
        
        util_mirrored([0,1,0])
        translate([0,esc_disk_width/2, 0])
        cube([esc_nacelle_l, esc_nacelle_w, esc_nacelle_h], center=true);
    }

    util_mirrored([0,1,0])
    hull() {
        translate([0,esc_disk_width/2 - esc_nacelle_w/2,0])
        rotate([0,90,0])
        cylinder(h=esc_nacelle_l, d=esc_disk_up+esc_disk_down, center=true);

        translate([0,esc_disk_width/2, -(esc_nacelle_h-esc_disk_up-esc_disk_down)/2])
        rotate([0,90,0])
        cylinder(h=esc_nacelle_l*.75, d=esc_nacelle_h, center=true);
    }


    util_mirrored([0,1,0])
    translate([0,esc_disk_width/2, -(esc_nacelle_h-esc_disk_up-esc_disk_down)/2])
    hull()
    util_mirrored([1,0,0])
    translate([.9*esc_nacelle_l/2,0,0])
    scale([.5,1,1])
    sphere(d=esc_disk_up+esc_disk_down);

    mirror([1,0,0])
    translate([0,0,esc_disk_down])
    util_nacelle(esc_def_l, esc_def_w, esc_def_h, curved=true, up=false);
}

module escort_pos() {
    translate([-cr_b-esc_disk_f, 0, -esc_disk_up-cr_rear_section_h+.01])
    escort();
}

escort_pos();