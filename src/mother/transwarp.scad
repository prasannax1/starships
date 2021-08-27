use <../lib/util.scad>;
include <common.scad>;

//include <saucer.scad>;
//demo();

module tw_saucer() {
    difference() {
        hull() {
            tw_saucer_pos() tw_saucer_basic();

            translate([-saucer_width/3,0,0])
            tw_saucer_pos() tw_saucer_basic();
        }

        cylinder(d=tw_saucer_inner, h=500, center=true, $fn=faces_concave);

        hull() {
            cylinder(d=command_body_w, h=700,  center=true, $fn=faces_concave);
                
            translate([-saucer_width/3,0,0])
            cylinder(d=command_body_w, h=700,  center=true, $fn=faces_concave);
        }
    }
    
    translate([-saucer_width/2+scout_width/2,0,saucer_height+tw_saucer_height])
    disk_class_2();
}




module tw_body() {
    difference(){
        translate([-carrier_body_l/2-saucer_width/2,0,0])
        scale([1,1,.96])
        rotate([0,90,0])
        rotate(30) {
            cylinder(
            d=carrier_body_w, 
            h=carrier_body_l+2,
            center=true,
            $fn=6);
            
            translate([0,0, -carrier_body_l/2])
            sphere(d=carrier_body_w, $fn=6);
        }


        translate([-saucer_width/2-carrier_body_l,0,carrier_body_w/2 + 10])
        scale([2*carrier_body_l/carrier_body_w,1,1])
        rotate([90,0,0])
        cylinder(
            d=carrier_body_w,
            h=carrier_body_w*2,
            center=true,
            $fn=faces_concave);

        translate([-saucer_width/2-carrier_body_l/2,0,0])
        translate([0,0,-saucer_width/2-.01])
        cube(saucer_width, center=true);
        
        translate([-saucer_width/2-carrier_body_l/2,0,saucer_height])
        scale([1,1,1.5])
        rotate([0,90,0])
        cylinder(
            h=saucer_width,
            d=command_body_w,
            center=true,
            $fn=faces_concave);
    }
    
    translate([-saucer_width/2-carrier_body_l,0,9.9])
    difference() {
        scale([1,.8,.2])
        rotate([0,90,0])
        rotate(30)
        sphere(d=carrier_body_w, $fn=6);
        
        translate([0,0,-saucer_width/2])
        cube(saucer_width, center=true);
    }
}

module tw_assembly() {
    translate([-100,0,0])
    nacelle_pos() tw_nacelle();
    
    nacelle_pos()
    translate([0,-saucer_height-tw_saucer_height,0])
    rotate([0,90,0])
    difference() {
        cylinder(
            r=saucer_height+tw_saucer_height,
            h=150,
            center=true,
            $fn=faces_convex);

        cylinder(
            r=saucer_height+tw_saucer_height-10,
            h=220,
            center=true,
            $fn=faces_concave);
        
        translate([-saucer_width/2-.01,0,0])
        cube(saucer_width, center=true);
        
            translate([0, -saucer_width/2-.01,0])
        cube(saucer_width, center=true);
    }

    n_width=saucer_width-2*wt_w-2*saucer_height-2*tw_saucer_height;

    translate([-saucer_width/2-carrier_body_l/4-wt_f+75,0,10])
    difference() {
        cube([300,n_width+2,20],center=true);
        
        translate([0,0,saucer_width/2])
        cube(saucer_width, center=true);
        
        util_mirrored([0,1,0])
        translate([150, n_width/2,0])
        scale([1,.65,1])
        cylinder(d=300, h=100, center=true, $fn=faces_concave);
    }    
}

module tw_nacelle() {    
    hull()
    util_mirrored([0,1,0])
    util_mirrored([1,0,0])
    translate([200,10,-15])
    sphere(d=20);
}




module transwarp() {
    tw_saucer();
    tw_body();
    tw_assembly();
}

transwarp();