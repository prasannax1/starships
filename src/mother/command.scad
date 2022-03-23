use <../lib/util.scad>;
include <common.scad>;

module command_disk() {
    disk_class_3();
    disk_class_1();
}

module command_body() {
    difference() {
        intersection() {
            util_ovoid(command_body_width,
                command_body_length*1.1,
                command_body_width,
                command_body_width/2,
                command_body_width/2,
                faces=faces_convex);
            
            translate([-command_width*.9/2,0,0])
            cube(command_width*.9, center=true);
        }
        
        translate([0,0,-command_body_width/2+.02])
        scale([scout_width/command_body_width,1,1])
        rotate([90,0,0])
        cylinder(d=command_body_width, h=command_width, center=true, $fn=faces_concave);
        
        intersection() {
            rotate([0,90,0])
            cylinder(h=scout_width, d=command_body_width*.8, center=true, $fn=faces_concave);
            
            translate([0,0,-command_width/2])
            cube(command_width, center=true);
        }
        
        translate([-command_body_length*.75,0,-command_body_width/2+.02])
        rotate([90,0,0])
        cylinder(d=command_body_width, h=command_width, center=true, $fn=faces_concave);

        translate([-command_body_length*.75,0,0])
        translate([-command_width/2,0,-command_width/2])
        cube(command_width, center=true);
        
        translate([-command_width*.9,0,0])
        intersection() {
            rotate([0,90,0])
            cylinder(d=20, h=2, $fn=faces_concave, center=true);

            translate([0,0,command_width/2+1])
            cube(command_width, center=true);
        }
    }

    translate([-scout_width/2,0,0])
    sphere(d=command_body_width*.75, $fn=faces_convex);
}

module command(tw_attached=true) {
    command_disk();
    command_body();
    if (tw_attached == true) {
        command_assembly(0);
    } else {
        command_assembly(command_theta);
    }    
}

module command_assembly(theta) {
    util_mirrored([0,1,0]) {
        rotate([theta,0,0]) 
        translate([-command_body_length*1.1, command_width/2-20, 0])
        rotate([-theta,0,0])
        command_nacelle();

        translate([0,0,2.5])
        rotate([theta,0,0])
        hull() {
            translate([-command_width/3-10,0,0])
            sphere(d=3);

            translate([-command_width*.75,0,0])
            sphere(d=3);

            translate([-command_body_length*1.1+10, command_width/2-20, 0])
            sphere(d=3);

            translate([-command_body_length*1.1-10, command_width/2-20, 0])
            sphere(d=3);
        }
    }
}


module command_nacelle() {
    difference() {
        translate([-10,0,2.5-.01])
        scale([1,.64,1])
        intersection() {
            rotate([0,90,0])
            rotate(90) {
                cylinder(r2=20,r1=18, h=command_body_length/2,$fn=6, center=true);
                translate([0,0,command_body_length/4+command_body_length/8-.01])
                cylinder(r1=20,r2=12, h=command_body_length/4, $fn=6, center=true);
                translate([0,0,-command_body_length/4-command_body_length/8+.01])
                cylinder(r2=18,r1=10, h=command_body_length/4, $fn=6, center=true);
                translate([0,0,command_body_length/2-.02])
                sphere(r=12, $fn=6);
                translate([0,0,-command_body_length/2+.02])
                sphere(r=10, $fn=6);
            }

            translate([0,0,250-2.5])
            cube(500,center=true);
        }
        
        translate([-.5*command_body_length,0,0])
        rotate([0,-45,0])
        translate([-250,0,0])
        cube(500, center=true);
    }
}

command(tw_attached=false);