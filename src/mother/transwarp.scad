use <../lib/util.scad>;
include <common.scad>;
//include <saucer.scad>;

tw_nacelle_f=250;
tw_nacelle_b=750;
tw_nacelle_w=120;
tw_nacelle_h=75;

module tw_body_plus() {
    union () {
        intersection() {
            hull()
            util_mirrored([0,0,1])
            body_pos() body_basic();


            translate([-saucer_width/2,0,-saucer_width/2 + saucer_height])
            cube(saucer_width, center=true);
        }

        translate([-carrier_body_l-carrier_body_l+carrier_body_w/4,0,0])
        cube([tw_body_l + carrier_body_l-carrier_body_w, carrier_body_w, 2*saucer_height], center=true);
        
        translate([-saucer_width/2-tw_body_l/2,0,(saucer_height+tw_saucer_height)/2])
        cube([tw_body_l, carrier_body_w, saucer_height+tw_saucer_height], center=true);
    }
}


module tw_body_minus() {
    translate([-saucer_width-carrier_body_l/2,0, saucer_height*2]) 
    cube([saucer_width*2, command_body_width, saucer_height*4], center=true);

    translate([-saucer_width-tw_body_l,0, saucer_height]) 
    cube([saucer_width, command_body_width, saucer_width], center=true);

    translate([-saucer_width -tw_body_l, 0, -saucer_width/2])
    cube(saucer_width-.01, center=true);

    translate([-saucer_width/2-tw_body_l/2,0,0])
    scale([(carrier_body_l+tw_body_l/2)/(saucer_height+tw_saucer_height-10),1,1])
    translate([-(saucer_height+tw_saucer_height)+10,0,(saucer_height+tw_saucer_height)])
    rotate([90,0,0])
    cylinder(r=(saucer_height+tw_saucer_height)-10, h=tw_body_w*2, center=true, $fn=100);
}



module tw_body() {
    difference() {
        tw_body_plus();
        tw_body_minus();
    }
    
    translate([-saucer_width/2-tw_body_l/1.5-carrier_body_l,0,5])
    difference() {
        cylinder(d=carrier_body_w, h=10, center=true, $fn=64);

        cylinder(d=command_body_width, h=20, center=true, $fn=64);

        translate([saucer_width/2,0,0])
        cube([saucer_width, command_body_width, saucer_width], center=true);
    }
    
    translate([-saucer_width/2-tw_body_l-carrier_body_l,0,10])
    difference() {
        rotate([0,90,0]) {
            cylinder(d=40, h=40, center=true);
            
            translate([0,0,-20])
            sphere(d=36);
        }

        translate([0,0,-255])
        cube(500, center=true);
    }
}

module tw_saucer() {
    difference() {
        hull()  
        tw_saucer_pos() tw_saucer_basic();

        translate([-saucer_width/2-tw_body_l/2,0,0])
        scale([(carrier_body_l+tw_body_l/2)/(saucer_height+tw_saucer_height-10),1,1])
        translate([-(saucer_height+tw_saucer_height)+10,0,(saucer_height+tw_saucer_height)])
        rotate([90,0,0])
        cylinder(r=(saucer_height+tw_saucer_height)-10, h=tw_body_w*2, center=true, $fn=100);
        
        cylinder($fn=100, d=tw_saucer_inner, h=saucer_width, center=true);

        translate([-saucer_width/2,0,0])
        cube([saucer_width, command_body_width, saucer_width], center=true);
    }

    translate([-saucer_width/2-scout_width/4,0,saucer_height+tw_saucer_height+5])
    bridge_module();

    util_mirrored([0,1,0])
    translate([-saucer_width/2-scout_width/4,scout_width/3,saucer_height+tw_saucer_height])
    cylinder(h=10, d=30, center=true);
}


module tw_nacelle() {
    hull() {
        util_mirrored([0,1,0])
        translate([0,tw_nacelle_w/4,0])
        util_ovoid(tw_nacelle_f, tw_nacelle_b, tw_nacelle_w/2, tw_nacelle_h/4, tw_nacelle_h/4);

        util_mirrored([0,1,0])
        translate([0,tw_nacelle_w/8,tw_nacelle_h/2])
        util_ovoid(tw_nacelle_f-50, tw_nacelle_b-100, tw_nacelle_w/2, tw_nacelle_h/4, tw_nacelle_h/4);
    }

    hull() {
        util_mirrored([0,1,0])
        translate([0,tw_nacelle_w/8,tw_nacelle_h/2])
        util_ovoid(tw_nacelle_f-50, 50, tw_nacelle_w/4, tw_nacelle_h/2.5, tw_nacelle_h/4);
    }
}


module tw_assembly() {
    util_mirrored([0,1,0]) {
        translate([-saucer_width-tw_body_l/2, saucer_width/2-tw_nacelle_w, saucer_height+tw_saucer_height])
        tw_nacelle();

        hull() {
            translate([-saucer_width-tw_body_l/2-100, saucer_width/2-tw_nacelle_w, saucer_height+tw_saucer_height])
            sphere(d=10);

            translate([-saucer_width-tw_body_l/2-225, saucer_width/2-tw_nacelle_w, saucer_height+tw_saucer_height])
            sphere(d=10);

            translate([-saucer_width/2-tw_body_l,tw_body_w/2, 5])
            sphere(d=10);

            translate([-saucer_width/2-tw_body_l/2 - carrier_body_l,tw_body_w/2, 5])
            sphere(d=10);
        }
    }
}


module transwarp() {
    tw_body();
    tw_saucer();
    tw_assembly();
}

transwarp();