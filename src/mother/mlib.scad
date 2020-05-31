use <../lib/util.scad>;

modules=["saucer","engine","command","escort"];

engine_front=250;
engine_back=300;
engine_up=50;
engine_down=100;
engine_width=180;
engine_disk_up=15;
engine_disk_down=5;
engine_faces=32;
engine_wall_ratio=0.99;
engine_inv_ratio=1.6;
engine_defl_x2=80;

nacelle_place_width=472;
nacelle_place_height_diff=0;
nacelle_place_height=engine_up+nacelle_place_height_diff;

nacelle_front=250;
nacelle_back=500;
nacelle_width=90;
nacelle_up=50;
nacelle_down=10;
nacelle_brussard_h=60;

saucer_width=750;
saucer_up=60;
saucer_up_ext=5;
saucer_down=20;
saucer_hangar_height=20;
saucer_hangar_width=120;
saucer_hangar_in=55;
saucer_segments=16;

command_width=250;
command_height=17;
command_shuttlebay_width=120;
command_engine_width=50;
command_engine_length_f=75;
command_engine_length_b=125;
command_engine_up=5;
command_engine_down=60;
command_hangar_height=20;
command_bridge_width=40;
command_bridge_height=5;
command_nacelle_length_f=50;
command_nacelle_length_b=200;
command_nacelle_height=28;
command_nacelle_width=24;

escort_width=150;
escort_down=20;
escort_up=1;
escort_nacelle_length=110;
escort_nacelle_height=36;
escort_nacelle_width=48;
escort_minus_length=25;

separate_length=500;
separate_height=50;

module engine_body() {
    util_ovoid(
        engine_front,
        engine_back,
        engine_width,
        engine_disk_up,
        engine_disk_down);
    
    difference() {
        util_ovoid(
            engine_front,
            engine_back,
            engine_width,
            engine_up,
            engine_down);

        translate([engine_front,0,-engine_down])
        scale([.8*engine_front/engine_down,1,1])
        rotate([90,0,0])
        cylinder(h=1.2*engine_width,
            r=engine_down, center=true);
        
        translate([-engine_back,0,-engine_down])
        scale([0.5*engine_back/engine_down,1,1])
        rotate([90,0,0])
        cylinder(h=1.2*engine_width, r=engine_down, center=true);
        
        translate([-engine_back, 0, engine_width/2])
        cube(engine_width, center=true);
    }

    difference() {
        util_ovoid(
            engine_front,
            engine_back,
            engine_width,
            engine_up+0,
            5);
        
        translate([-engine_back-0.5*engine_width+50,0,20])
        rotate([0,30,0])
        cube(engine_width, center=true);
        
        translate([saucer_width/2,0,10])
        cylinder(h=2*max(saucer_up, saucer_down), d=saucer_width,
            center=true);
    }

    difference() {
        util_ovoid(
            engine_front/engine_inv_ratio,
            5,
            engine_width*engine_wall_ratio,
            5,
            engine_down*engine_wall_ratio);

        translate([engine_front/engine_inv_ratio,
            0,-engine_down/2])
        rotate([0,-90,0])
        cylinder(h=engine_defl_x2, d1=80, d2=15, center=true);
    }
}


module mvm_transwarp() {
    engine_body();
    engine_nacelle_bars();
    engine_nacelles();
}

module engine_nacelle_bars() {
    difference() {
        hull() {
            util_ovoid(engine_front, engine_back, engine_width,
                5,5);

            translate([0,0,nacelle_place_height])
            cube([saucer_width, nacelle_place_width, 1], center=true);
        }


        hull() {
            translate([0,0,+5])
            util_ovoid(engine_front-7.5, engine_back-7.5, engine_width-15,
                5,5);  

            translate([0,0,nacelle_place_height+5])
            cube([saucer_width-15, nacelle_place_width-15, 1], center=true);
        }
        
        translate([saucer_width/2,0,0])
        cube(saucer_width, center=true);
        
        util_mirrored([0,1,0])
        translate([0,engine_width/2+1.6*engine_front-5,0])
        cylinder(h=4*nacelle_place_height, r=1.6*engine_front,
            center=true);

        translate([-engine_back-0.64*nacelle_place_width+10,0,0])
        cylinder(h=4*nacelle_place_height, r=0.64*nacelle_place_width,
            center=true);
    }
}

module engine_nacelles() {
    util_mirrored([0,1,0])
    translate([-nacelle_front,
        nacelle_place_width/2-nacelle_width/2.8,
        nacelle_place_height])
    util_ovoid(
        nacelle_front,
        nacelle_back,
        nacelle_width,
        nacelle_up,
        nacelle_down);
    
    util_mirrored([0,1,0])
    translate([-nacelle_front/2,
        nacelle_place_width/2-nacelle_width/2.8,
        nacelle_place_height])
    util_ovoid(nacelle_front/2,
        nacelle_back/2,
        nacelle_width,
        nacelle_brussard_h,
        5);
}

module mvm_saucer_plus() {
    difference() {
        util_ovoid(saucer_width/2,
            saucer_width/2,
            saucer_width,
            saucer_up + saucer_up_ext,
            saucer_down);

        for (theta = [0: 1: 12]) {
            rotate(6*360/saucer_segments - theta*360/saucer_segments)
            translate([saucer_width/2, 0,saucer_hangar_height/2+2])
            cube([saucer_hangar_in,
                saucer_hangar_width,
                saucer_hangar_height], center=true);
        }
            
        translate([0,0,saucer_width/2 + saucer_up])
        cube(saucer_width, center=true);
    }

    difference() {
        intersection() {
            util_nacelle(saucer_width, engine_width*1.5, 1.5*saucer_up,
                curved=true);

            translate([0,0,saucer_up/2])
            cylinder(h=saucer_up+5*saucer_up_ext, d1=saucer_width,
                d2=saucer_width+saucer_up, center=true);
        }

        translate([0,0,1.5*saucer_width/2 + saucer_up])
        cube(1.5*saucer_width, center=true);
    }
}

module mvm_command_plus() {
    util_saucer(command_width, command_width, command_height);
    
    translate([-command_width/2,0,0]) {
    util_ovoid(
        command_engine_length_f,
        command_engine_length_b,
        command_engine_width,
        command_engine_up,
        command_engine_down);
    
    util_ovoid(
        command_engine_length_f,
        20,
        command_engine_width,
        0.8*command_height,
        5);
    }
    
    
        
    difference() {
        translate([-command_width/2,0,0])
        util_ovoid(
            5,
            command_engine_length_b,
            command_engine_width,
            command_hangar_height,
            1);
        
        translate([-command_width/4,0,0])
        rotate([0,-15,0])
        cube(command_engine_length_b, center=true);
        
        translate([-command_width-command_hangar_height,0,0])
        translate([0,0,command_hangar_height])
        rotate([0,30,0])
        cube(command_engine_length_b, center=true);
    }
    
    translate([0,0,command_hangar_height/2])
    cylinder(h=command_hangar_height, d=command_shuttlebay_width, center=true);
    
    intersection() {
        util_nacelle(command_width, command_shuttlebay_width,
            1.5*command_hangar_height);
        
        translate([0,0,
            -1.3*command_shuttlebay_width/2+command_hangar_height])
        cube(1.3*command_shuttlebay_width, center=true);
    }
    
    translate([0,0,command_hangar_height])
    util_ovoid(
        command_bridge_width/2,
        command_bridge_width/2,
        command_bridge_width,
        command_bridge_height,
        command_bridge_height,
        faces=12);
    
    util_mirrored([0,1,0])
    translate([-command_width/2-command_nacelle_length_f, command_engine_width/2-2, 2])
    rotate([-45,0,0])
    util_ovoid(
        command_nacelle_length_f,
        command_nacelle_length_b,
        command_nacelle_width,
        command_nacelle_height,
        3,
        faces=9);
    
}

module mvm_saucer() {
    mvm_saucer_basic(command_attached=false, engine_attached=false);
}

module mvm_command_basic(saucer_attached=true,
    engine_attached=true) {
    difference() {
        mvm_command_plus();
        if (engine_attached == false) {
            mvm_command_minus_engine();
        }
        if (saucer_attached == false) {
            mvm_command_minus_saucer();
        }
    }
}

module mvm_scout() {
    mvm_command_basic(
        saucer_attached=false,
        engine_attached=false
    );
}

module mvm_command_minus_saucer() {
    translate([0,0,-command_engine_down*.3])
    rotate([0,-90,0])
    cylinder(h=command_width*.66, d1=25, d2=10, center=true);
}

module mvm_command_minus_engine() {
    translate([-saucer_width/2,0,-saucer_up])
    util_ovoid(engine_front, engine_back, engine_width,
        engine_up, engine_down);
}

module mvm_saucer_basic(engine_attached=true, command_attached=true) {
    difference() {
        mvm_saucer_plus();
        mvm_saucer_minus_always();
        if (engine_attached == false) {
            mvm_saucer_minus_engine();
        }
        if (command_attached == false) {
            mvm_saucer_minus_command();
        }
    }
}

module mvm_saucer_minus_always() {
    translate([-saucer_width/4-command_width/2,0,saucer_up])
    scale([1,1,command_engine_down*2/command_engine_width])
    rotate([0,90,0])
    cylinder(h=saucer_width/2, d=command_engine_width, 
        center=true);
    
    hull() {
        translate([0,0,-saucer_down/2-1.01])
        cylinder(h=saucer_down+2, d2=escort_width+10, 
        d1=escort_width+20,center=true);

        translate([-saucer_width/2,0,-saucer_down/2-1.01])
        scale([engine_front*2/engine_width,1,1])
        cylinder(h=saucer_down+2, d2=engine_width+10, d1=engine_width+20, center=true);
    }
}

module mvm_saucer_minus_engine() {
    translate([-saucer_width/2,0,0])
    util_ovoid(engine_front, engine_back, engine_width,
        engine_up, engine_down);
}

module mvm_saucer_minus_command() {
    translate([-command_width/2,0,saucer_up])
    util_ovoid(command_engine_length_f, command_engine_length_b,
        command_engine_width, command_engine_up, command_engine_down);
}

module mother() {
    translate([-saucer_width/2,0,0]) mvm_transwarp();
    translate([0,0,saucer_up-.01]) mvm_command_basic();
    translate([0,0,0]) mvm_saucer_basic();
    translate([0,0,.01]) mvm_escort();
}

module mvm_escort() {
    difference() {
        union() {
            difference() {
                util_ovoid(
                    escort_width/2,
                    escort_width/2,
                    escort_width,
                    escort_up,
                    escort_down);

                translate([-escort_width+escort_minus_length,0,0])
                cube(escort_width, center=true);
            }

            util_mirrored([0,1,0])
            translate([-escort_width/2+escort_minus_length, escort_width/2 - escort_nacelle_height, 0])
            rotate([90,0,0])
            util_ovoid(
                escort_nacelle_length/2,
                escort_nacelle_length,
                escort_nacelle_width,
                1,
                escort_nacelle_height,
                faces=8);

        }

        translate([0,0,saucer_width/2])
        cube(saucer_width, center=true);
        
        translate([escort_width/2,0,0])
        cube(25, center=true);
    }
}

module mvm_battle_separate() {
    translate([-saucer_width/2-separate_length/2,0,20]) mvm_transwarp();
    translate([0-separate_length/2,0,saucer_up-.01+20]) mvm_command_basic(saucer_attached=false);
    translate([0+separate_length/2,0,0]) mvm_saucer_basic(engine_attached=false, command_attached=false);
    translate([0+separate_length/2,0,.01]) mvm_escort();
}


module mvm_escort_separate() {
    translate([-saucer_width/2,0,0]) mvm_transwarp();
    translate([0,0,saucer_up-.01]) mvm_command_basic();
    translate([0,0,0]) mvm_saucer_basic();
    translate([0,0,.01-separate_height]) mvm_escort();
}

module mvm_full_separate() {
    translate([-saucer_width/2-separate_length/2,0,20-separate_height]) mvm_transwarp();
    translate([0-separate_length/2,0,saucer_up-.01+20+2*separate_height]) mvm_command_basic(saucer_attached=false, engine_attached=false);
    translate([0+separate_length/2,0,0]) mvm_saucer_basic(engine_attached=false, command_attached=false);
    translate([0/2,0,.01-2*separate_height]) mvm_escort();
}

module m_main_sep() {
    mvm_full_separate();
}

module mvm_normal_separate() {
    translate([-saucer_width/2-separate_length/2,0,0]) mvm_transwarp();
    translate([0+separate_length/2,0,saucer_up-.01]) mvm_command_basic(engine_attached=false);
    translate([0+separate_length/2,0,0]) mvm_saucer_basic(engine_attached=false);
    translate([0+separate_length/2,0,.01]) mvm_escort();
}

module mvm_scout_separate() {
    translate([-saucer_width/2,0,0]) mvm_transwarp();
    translate([0,0,saucer_up-.01+2*separate_height]) mvm_command_basic(saucer_attached=false, engine_attached=false);
    translate([0,0,0]) mvm_saucer_basic(command_attached=false);
    translate([0,0,.01]) mvm_escort();
}

module mvm_transwarp_full() {
    translate([-saucer_width/2,0,0]) mvm_transwarp();
    translate([0,0,saucer_up-.01]) mvm_command_basic(saucer_attached=false);
}