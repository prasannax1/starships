use <../lib/util.scad>;
include <common.scad>;


module saucer_disk() {
    saucer_basic();

    translate([0,0,saucer_height])
    bridge_module();
}

module saucer_body() {
    difference() {
        saucer_body_plus();
        saucer_body_minus();
    }
    
    translate([-saucer_width/2+scout_width*.75,0,-tw_body_w/2+saucer_height])
    rotate([0,90,0]){   
       difference() { 
            cylinder(h=100, d=100, center=true, $fn=100);
            
            translate([0,0,50])
            scale([1,1,.2])
            sphere(d=75, $fn=100);
       }
    }
}


module saucer_body_minus() {
    translate([-saucer_width/2,0,saucer_height-5])
    cube([20,40, 8], center=true);
    
    hull() {
        translate([-saucer_width/2+scout_width,0,0])
        cylinder(d=scout_width, h=scout_height*2.5, center=true);
        
        cylinder(d=scout_width, h=scout_height*2.5, center=true);
    }
    
    translate([-saucer_width/2+scout_width*1.5,0,-tw_body_w/2-scout_height-.01]) {
        scale([.5,1,1])
        rotate([90,0,0])
        cylinder($fn=100, d=tw_body_w, h=tw_body_w*2, center=true);

        translate([saucer_width/2,0,-saucer_width/2+tw_body_w/2])
        cube(saucer_width, center=true);
    }
    
    intersection() {
        translate([0,0,-tw_body_w/2+saucer_height])
        rotate([0,90,0])
        cylinder(d=.65*tw_body_w, h=.65*saucer_width, center=true, $fn=100);

        translate([0,0,-saucer_width/2-scout_height-.01])
        cube(saucer_width, center=true);
    }
}





module saucer_body_plus() {
        intersection() {
        hull()
        util_mirrored([0,0,1])
        saucer_body_pos() saucer_body_basic();

        translate([-10,0,-saucer_width/2 + saucer_height])
        cube(saucer_width, center=true);
    }
    
    hull() {
        translate([-saucer_width/2+scout_width,0,0])
        cylinder(d=scout_width*1.1, h=scout_height*2, center=true);
        
        cylinder(d=scout_width*1.1, h=scout_height*2, center=true);
    }
}


module saucer_nacelle() {
    hull()
    util_mirrored([0,0,1])
    util_mirrored([1,0,0])
    translate([100,0,10])
    sphere(d=20);
}

module saucer_assembly() {
    util_mirrored([0,1,0])
    translate([-saucer_width/2+75, tw_body_w/2, -tw_body_w/2+saucer_height])
    saucer_nacelle();

    translate([-saucer_width/2+scout_width/2,0,-tw_body_w/2+saucer_height])
    rotate([90,0,0])
    cylinder(h=tw_body_w, d=20, center=true);
}

module saucer() {
    saucer_disk();
    saucer_body();
    saucer_assembly();
}

saucer();