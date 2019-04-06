sphere_radius = 10;
rear_radius = 7.5;
side_radius = 5;
pylon_radius = 2.5;

disk_outer_bottom = 40;
disk_outer_top = 35;
disk_inner_bottom = 15;
disk_inner_top = 15;
disk_height = 10;

body_length = disk_outer_bottom;
side_length = body_length/2;

PI = 3.14159265;
disk_segments = 12;
disk_segment_angle = 360/disk_segments;
disk_segment_outer = (PI * disk_outer_bottom)/disk_segments;
disk_degment_inner = (PI * disk_inner_bottom)/disk_segments;

module ms_disk_subtract_rounded() {
    difference() {
        translate([-disk_outer_bottom,0, -(disk_outer_bottom/2)])
            cube([disk_outer_bottom*2,disk_outer_bottom,disk_outer_bottom]);

        scale([1,1,0.5])
            translate([0,disk_outer_bottom,0])
                rotate([90,22.5,0])
                    cylinder(disk_outer_bottom,(disk_segment_outer*1.5),(disk_degment_inner*1.8), $fn=8);
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
    
    ms_disk_subtract_rounded();
}


module ms_disk_hangar() {
    difference() {
        translate([0,0,-5])
            cylinder(disk_height,disk_outer_bottom,disk_outer_top);

        ms_disk_subtract();
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

module ms_body_triangle() {
    scale([1,1,0.3])
        translate([9,-35,5])
            rotate([0,-90,0])
                cylinder(18,12,12,$fn=3);
}

module ms_body_side() {
    translate([0,-body_length,0])
        rotate([0,90,0])
            cylinder(side_length,rear_radius,side_radius);

    translate([side_length,-body_length,0])
        sphere(side_radius);
}

module ms_body_double() {
    rotate([90,0,0])
        cylinder(body_length,sphere_radius,rear_radius);

    translate([0,-body_length,0])
        sphere(rear_radius);

    ms_body_side();

    mirror([1,0,0]) 
        ms_body_side();
}

module ms_body() {
    difference() {
        ms_body_double();

        translate([-body_length,-(body_length + side_length),0])
            cube(body_length * 2);
    }
    ms_body_triangle();
}

module ms_body_hull() {
    hull() ms_body();
}

module ms_pylon() {
    rotate([45,0,0])
        cylinder(16,side_radius,pylon_radius);
    sphere(5);
}

module ms_nacelle() {
    scale([1.2,1,.6]) difference() {
        union() {
            rotate([90,45,0])
                cylinder(75,6,3, $fn=4);

            rotate([0,90,0])
                sphere(6, $fn=4);
        }

        translate([-40,-160,-20])
            rotate([-45,0,0])
                cube(80);
    }
}

module ms_nacelle_assembly() {
    translate([20,-40,0])
        rotate([0,22.5,0])
            ms_pylon();

    translate([24,-40,11])
        ms_nacelle();
}



module ms_main() {
    ms_disk();
    ms_ball();
    ms_body();

    ms_nacelle_assembly();

    mirror([1,0,0]) 
        ms_nacelle_assembly();
}

module mothership() {
    scale(10) ms_main();
}

//rotate([0,0,180])
mothership();