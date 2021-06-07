use <../lib/util.scad>;
include <global.scad>;
include <carrier_lib.scad>;

//saucer_position() saucer_basic();

module cr_body() {
    difference() {
        union() {
            delta = 12;
            
            body_position() 
            body_basic();
            
            translate([-cr_disk_width/2+delta-100, 0, -cr_disk_height/2])
            util_saucer_shape(cr_disk_width, cr_disk_height/2, cr_disk_height/2, cr_disk_height/2, cr_disk_height/2);
            
            translate([-body_length-escort_width/2-cr_rear_curve,0,-cr_disk_height/2])
            scale([2,1,1])
            util_saucer_shape(cr_disk_width*.75, cr_disk_height/2, cr_disk_height/2, cr_disk_height/2, cr_disk_height/2);
        }

translate([-body_length+2, 0, -body_height/4-15])
rotate([0,-15,0])
translate([-0,0,0])
cube ([10, 125, 75], center=true);


        scale(1.01)
        tw_body_hexagon();

        translate([0,0,body_length*2+1])
        cube(body_length*4, center=true);
        
        translate([saucer_width/2-2,0,0])
        cube(saucer_width, center=true);
        
        hull() {
            translate([-body_length-cr_rear_curve, 0, -body_height/4])
            rotate([90,0,0])
            cylinder(r=cr_rear_curve, h=body_width*1.5, center=true, $fn=64);

            translate([-body_length*3, 0, -body_height/4])
            rotate([90,0,0])
            cylinder(r=cr_rear_curve, h=body_width*1.5, center=true, $fn=64);

            translate([-body_length+2*cr_rear_curve, 0, -body_height*2])
            rotate([90,0,0])
            cylinder(r=cr_rear_curve, h=body_width*1.5, center=true, $fn=64);
        }
        
        hull() {
            translate([-body_length-escort_width/2-cr_rear_curve,0,0])
            cylinder(d=escort_width-1, h=2*body_height, center=true);

            translate([-body_length-body_back,0,0])
            cylinder(d=escort_width, h=2*body_height, center=true);
        }
    }
    
    difference() {
        translate([-100,0,-body_height/4])
        rotate([0,90,0])
        cylinder(d=125,h=200, center=true);
        
        scale(.95)
        tw_body_hexagon();
        
        translate([0,0,saucer_width/2])
        cube(saucer_width, center=true);
    }

}



module carrier() {
    cr_body();
    cr_assembly();
}
module cr_nacelle() {
    hull()
    util_mirrored([0,0,1])
    translate([0,0,cr_nacelle_h/2])
    util_ovoid(cr_nacelle_f, cr_nacelle_b, cr_nacelle_w, cr_nacelle_h/2, cr_nacelle_h/2);
}

module cr_assembly() {
    util_mirrored([0,1,0])
    translate([-body_length-escort_width-cr_rear_curve,cr_disk_width*.75/2-cr_nacelle_w/2,-cr_nacelle_h/4])
    rotate([-45,0,0])
    translate([-0,0,cr_nacelle_h/2])
    cr_nacelle();
}

carrier();




