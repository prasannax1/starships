engine_front=200;
engine_front_full=250;
engine_width=120;
engine_rear_width=75;
engine_mid_width=100;
engine_back=600;
engine_rear_height_offset=25;
engine_height=50;
deflector_width=64;

neck_width=50;
neck_height=100;
neck_offset=75;

disk_width=450;
disk_height=30;
disk_h_over=40;
disk_neck_width=180;

nacelle_front=150;
nacelle_back=650;
nacelle_width=100;
nacelle_height=30;
nacelle_pos_width=400;

module tw_neck() {
    difference() {
        //translate([neck_offset/2,0,0])
        hull()
        util_mirrored([1,0,0])
        translate([neck_offset,0,engine_rear_height_offset+neck_height/2-.01])
        cylinder(d=neck_width,h=neck_height+.02,center=true);

        translate([-neck_offset*1.5,0,neck_height*1.5])
        rotate([0,45,0])
        cube(200,center=true);
    }
}