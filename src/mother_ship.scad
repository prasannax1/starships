sphere_radius = 7.5;
rear_radius = 10;
side_radius = 5;
pylon_radius = 2.5;

disk_outer_bottom = 40;
disk_outer_top = 35;
disk_inner_bottom = 10;
disk_inner_top = 10;
disk_height = 10;

body_length = disk_outer_bottom;
side_length = 0; //body_length/2.5;

nacelle_front_radius = disk_height * 0.6;
nacelle_rear_radius = nacelle_front_radius / 2;

PI = 3.14159265;
disk_segments = 16;
disk_segment_angle = 360/disk_segments;
disk_segment_outer = (PI * disk_outer_bottom)/disk_segments;
disk_degment_inner = (PI * disk_inner_bottom)/disk_segments;

module ms_corner_bar() {
    translate([0,0,(disk_height /2)])
		rotate([90,0,(disk_segment_angle /2)])
			cylinder(disk_outer_bottom, 0.5, 0.5, $fn = 4);
}

module ms_snip_corners() {
	rotate([0,0,180]) {
		ms_corner_bar(); 
		mirror([1,0,0]) ms_corner_bar();
		mirror([0,0,1]) ms_corner_bar();
		mirror([0,0,1]) mirror([1,0,0]) ms_corner_bar();
	}
}

module ms_disk_subtract() {
    translate([0,0,-(disk_outer_bottom/2)]) union() {
        mirror([1,0,0])
            rotate([0,0,-(disk_segment_angle/2)])
                cube(disk_outer_bottom);

        rotate([0,0,-(disk_segment_angle/2)])
            cube(disk_outer_bottom);

        cylinder(disk_height*4,disk_inner_bottom,disk_inner_top);

        translate([-disk_outer_bottom,-disk_outer_bottom, 0])
            cube([disk_outer_bottom*2,disk_outer_bottom,disk_outer_bottom]);
    }
    
}


module ms_disk_hangar() {
    difference() {
        translate([0,0,-(disk_height/2)])
            cylinder(disk_height,disk_outer_bottom,disk_outer_top);

        ms_disk_subtract();
		ms_snip_corners();
    }
}

module ms_disk() {
    for(angle=[0:disk_segment_angle:(360 - disk_segment_angle)])
        rotate([0,0,angle])
            ms_disk_hangar();
}

module ms_ball() {
    sphere(sphere_radius);
}



module ms_body_double() {
    rotate([90,0,0])
        cylinder(body_length,sphere_radius,rear_radius);

    translate([0,-body_length,0])
        sphere(rear_radius);
}

module ms_body() {
    difference() {
        ms_body_double();

              translate([-body_length,-(body_length + rear_radius+ 1),0])
            cube(body_length * 2);
    }
    
    translate([0,-body_length,0])
        sphere(sphere_radius);
}

module ms_body_hull() {
    hull() ms_body();
}


module ms_main() {
    ms_disk();
    ms_ball();
    ms_body();

    ms_nacelle_assembly_2();

    mirror([1,0,0]) 
        ms_nacelle_assembly_2();
}

module mothership() {
    scale(10) ms_main();
}

//rotate([0,0,180])
mothership();

module ms_nacelle_assembly_2() {
    ms_pylon_2();

    translate([body_length*.6, -body_length*1.5, body_length*.3])
        ms_nacelle_2();
}

module ms_nacelle_2() {
    scale([0.45,1.5,0.8]) difference() {
        union() {
            rotate([90,0,0])
                cylinder(body_length, nacelle_front_radius, nacelle_rear_radius, $fn=6);

            translate([0,0,nacelle_front_radius*0.1])
                sphere(nacelle_front_radius * 1.1, $fn=6);
        }

        translate([0,-body_length*1.4,-nacelle_front_radius*1.4])
            rotate([45,0,0])
                cube(body_length, center=true);
    }
}

module ms_pylon_2() {
    scale([0.8,1,0.4])
        rotate([0,45,0])
            translate([side_radius,-body_length + side_radius, -1])
                rotate([0,0,-180])
                    ms_slant_bar();
}



module ms_slant_bar() {
    difference() {
        translate([-1,0,0])
            cube([2,disk_outer_bottom,disk_outer_bottom]);

        translate([-disk_outer_bottom,-1,-1])
            rotate([50,0,0])
                cube(disk_outer_bottom*2);

        translate([-disk_outer_bottom,disk_outer_bottom*1.5,-disk_outer_bottom*1.5])
            rotate([50,0,0])
                cube(disk_outer_bottom*2);
    }
}