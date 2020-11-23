use <../lib/util.scad>;
use <../combined/multilib.scad>;
use <../mother/mlib.scad>;
use <../macs/macs.scad>;

module hull4() {
    difference() {
        union() {
            //util_saucer(30,20,10);
            
            scale([1.25,1,1])
            hull()
            repeat(3, rv=[0,0,120])
            translate([-11,0,0])
            util_saucer(12.5,40,7);



            //util_saucer(30,30,10);

            hull()
            difference() {
                util_mirrored([0,1,0])
                rotate([0,-90,0])
                translate([0,5,10])
                rotate(90)
                cylinder(d=17,h=25,center=true,$fn=6);
                
                translate([-12.5,0,-50-2])
                cube(100,center=true);
            }
        }

        translate([-35,0,0])
        rotate([0,-15,0])
        cube([40,15,40],center=true);
        
        translate([0,0,20+7])
        cube([40,15,40],center=true);
        
        translate([0,0,-20])
        cube([60,15,40],center=true);

    }
}

module heavy_hull(warp=true, impulse=true) {
    difference() {
        union() {
            hull() {
                translate([4,0,0])
                scale([1.24,1,1])
                repeat(3, rv=[0,0,120])
                translate([-11,0,0])
                //util_saucer(12.5,40,7);
                scale([1.25,4,1.4]) sphere(5, $fn=13);
                
                translate([0,0,0])
                rotate([0,-90,0])
                util_mirrored([0,1,0])
                translate([0,5.4,10])
                rotate(30)
                cylinder(r=4,h=20,$fn=6,center=true);
            }


            translate([0,0,3.5])
            rotate([0,-90,0])
            hull()
            util_mirrored([0,1,0])
            translate([0,7.5,10])
            rotate(30)
            cylinder(r=4,h=20,$fn=6,center=true);
        }

        translate([0,0,-50])
        cube(100,center=true);  
      
        translate([-10,0,3.5])
        rotate([0,-90,0])
        hull()
        util_mirrored([0,1,0])
        translate([0,7.5,10])
        rotate(30)
        cylinder(r=1,h=1,$fn=6,center=true);

        translate([-10,0,3.5])
        rotate([0,-90,0])
        util_mirrored([0,1,0])
        translate([0,7.5,10])
        rotate(30)
        cylinder(r=3,h=1,$fn=6,center=true);
        
        translate([-10,0,3.5])
        rotate([0,-90,0])
        util_mirrored([0,1,0])
        translate([0,7.5,10])
        rotate(30)
        cylinder(r=2.5,h=2,$fn=6,center=true);
        
        translate([0,0,7])
        cylinder(r=5,h=.5, center=true);

        translate([-12,0,7])
        cube([22,10,.5],center=true);
        
        util_mirrored([0,1,0])
        translate([-6,22,0])
        rotate([-0,0,0])
        cylinder(r=8,h=20,$fn=6, center=true);
    }

    if (warp == true) {
        difference() {
            util_mirrored([0,1,0])
            translate([-5,15,0])
            scale([1.6,.9,1])
            saucer_shape(10,3.6,1,1,0);

            translate([0,0,-50+.5])
            cube(100,center=true); 
        }
    }
}



module diplomat_hull() {
    heavy_hull();
    
    difference() {
        translate([-20,0,0])
        util_ovoid(25,20,20,7,5);

        translate([-60,0,0])
        cube(50,center=true);
        
        translate([25,0,0])
        cube(50,center=true);
        
        translate([-35,0,-5])
        scale([3.5,1,1])
        rotate([90,0,0])
        cylinder(r=5,h=50,center=true);
    }

    
    translate([-33,0,0]) {
        util_saucer(13,13,.75);
        util_saucer(12.5,12.5,4.5);
    }
    
    
    difference() {
        util_mirrored([0,1,0])
        translate([-40,15,8])
        hull() {
        //util_mirrored([1,0,0])
            translate([20,0,0])
            scale([1,1,1])
            sphere(3,$fn=16);
                
            translate([-20,0,0])
            scale([3,1,1])
            sphere(2,$fn=16);
                
        }
        translate([-86,0,0])
        rotate([0,45,0])
        cube(50,center=true);
    }
    
    util_mirrored([0,1,0])
    translate([0,6,0])
     rotate([135,0,0])   
    translate([-25,0,-7.5])
    cube([5,2,12],center=true);

}



module attack_hull_1() {
    heavy_hull(warp=true);


    difference() {
        translate([0,0,3.5])
        util_ovoid(50,50,15,7.5,7.5);

        translate([50,0,0])
        cube(100,center=true);
        
        translate([-90,0,0])
        cube(100,center=true);
        
        translate([-40,0,3.5])
        rotate([0,90,0])
        difference() {
            cylinder(h=.5,d=3,center=true,$fn=16);
            cylinder(h=2,d=2.5,center=true,$fn=16);
        }
        
//        translate([-20,0,-50-2])
//        cube(100,center=true);
    }

    util_mirrored([0,1,0])
    translate([-26.3,7.5,1])
    rotate([45,0,0]) {
        hull() {
            translate([0,0,-3])
            util_ovoid(5,40,3.75,1.75,1);

            translate([0,0,-5])
            util_ovoid(15,38,3.6,1.8,1.8);

            translate([0,0,-7])
            util_ovoid(15,33,3.5,1,1.75);
        }

        hull()
        util_mirrored([0,0,1])
        translate([2,0,-7])
        rotate([0,90,0])
        cylinder(d=4,h=9,$fn=16, center=true);
    }

//    translate([-4,0,0])
////    util_mirrored([0,0,1])
//    translate([0,0,7])
//    saucer_shape(18,3,.5,2.5,1);
    
    translate([0,0,3.5])
    saucer_shape(14,7,0,1,0);
}

module attack_hull_2() {
    heavy_hull(warp=false);

    difference() {
        translate([-10,0,0])
        //hull() {
            mirror([0,0,1])
            util_nacelle(30,20,12,curved=true,up=false);

            //util_ovoid(30,30,20,1,5);
        //}
        
        translate([50+15,0,-20])
        rotate([0,45,0])
        cube(100,center=true);
        
        translate([-40,0,-5])
        scale([6,1,1])
        rotate([90,0,0])
        cylinder(r=5,h=50,center=true,$fn=32);
    }

    util_mirrored([0,1,0])
    translate([-6,14,2.5])
    rotate([60,0,0])
    util_nacelle(50,7.5,12.5,curved=true,up=false);
}


module attack_hull_3() {
    translate([20,0,0])
    heavy_hull();

    difference() {
        translate([-15+.01,0,-10])
        rotate([0,90,0])
        rotate(30)
        cylinder(d=40,h=30,center=true,$fn=6);

        translate([-15,0,-50])
        cube(100,center=true);
    }

    util_mirrored([0,1,0]) {
        translate([-15,8,7])
        rotate([0,90,0])
        rotate(30)
        cylinder(d=5,h=30,$fn=6,center=true);


        translate([-15,10,0])
        rotate([0,90,0])
        rotate(30)
        cylinder(d=10,h=30,$fn=6,center=true);
        
        translate([-5,5,3])
        rotate([60,0,0])
        translate([0,0,-5])
        util_nacelle(50,5,15,curved=true,up=false);
    }
}

module attack_hull_4() {
    heavy_hull(warp=false);
    
    difference() {
    translate([-6,0,0])
    util_ovoid(20,10,41,7.5,1,faces=13);
        
        translate([0,0,-50+.5])
        cube(100,center=true);
        
        translate([0,0,50+6.5])
        cube(100,center=true);
    }

    difference() {
        hull() {
            translate([-20,0,0])
            util_ovoid(20,20,20,1,5);


            translate([-20,0,3.5])
            rotate([0,-90,0])
            hull()
            util_mirrored([0,1,0])
            translate([0,7.5,10])
            rotate(30)
            cylinder(r1=4,r2=1,h=20,$fn=6,center=true);
        }

        translate([0,0,-8])
        rotate([90,0,0])
        cylinder(r=10,h=40,$fn=6,center=true);

        translate([-45,0,-5])
        scale([20/(5+3.5),1,1])
        rotate([90,0,0])
        cylinder(r=5+3.5,h=40,center=true);
    }

        util_mirrored([0,1,0])
        translate([-27,12.5,0])
        rotate([60,0,0]) {
            hull() {
                translate([0,0,-2])
                util_ovoid(10,40,4,2,2);

    //            translate([0,0,-5])
    //            util_ovoid(15,38,3.6,1.8,1.8);

                translate([0,0,-6])
                util_ovoid(10,40,4,2,2);
            }

            hull() {
                translate([7.5,0,7])
                rotate([0,90,0])
                cylinder(d=4,h=5,$fn=16, center=true);
                
                translate([-10,0,-2])
                rotate([0,90,0])
                cylinder(d2=6,d1=5,h=20,$fn=16, center=true);                
                translate([-10,0,-6])
                rotate([0,90,0])
                cylinder(d2=6,d1=5,h=20,$fn=16, center=true);
            }
        }
        

}

module beauty_contest() {
    translate([0,100,0]) attack_hull_1();
    translate([0,30,0]) attack_hull_2();
    translate([0,-30,0]) attack_hull_3();
    translate([0,-100,0]) attack_hull_4();
}

module lineup() {
    translate([0,90,0])
    heavy_hull();

    translate([0,30,0])
    diplomat_hull();

    translate([0,-30,0])
    attack_hull_4();
    
    translate([0,-90,0])
    explorer_hull();
}



module explorer_hull() {
    heavy_hull();

    difference() {
        hull() {
            translate([-20,0,0])
            util_ovoid(40,30,20,9.5,7);
            
            translate([0,0,7])
            util_ovoid(7.5,7.5,15,3,1);
        }

        translate([20+15,0,0])
        cube(50,center=true);
        
        translate([-45,0,10])
        rotate([90,0,0])
        cylinder(r=10,h=40,$fn=6,center=true);
        
        translate([-50,0,-7])
        scale([4,1,1])
        rotate([90,0,0])
        cylinder(r=7,h=40,center=true, $fn=100);
    }





    translate([0,0,7])
    saucer_shape(20,3,.5,1,0);

    translate([-36.5,0,0])
    util_saucer(15,15,7.5);

    util_mirrored([0,1,0])
    translate([-35,14,8])
    hull()
    util_mirrored([0,1,0])
    translate([0,2,0])
    util_ovoid(7.5,45,5,4,1);

    util_mirrored([0,1,0])
    hull() {
        translate([-10,0,0])
        sphere(1.5, $fn=10);

        translate([-20,0,0])
        sphere(1.5,$fn=10);

        translate([-40,14,8])
        sphere(1,$fn=10);

        translate([-45,14,8])
        sphere(1,$fn=10);
    }
}


lineup();