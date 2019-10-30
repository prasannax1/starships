use <util.scad>;

module model1() {
    cylinder(2,20,15);
    mirror([0,0,1])
        cylinder(2,20,19);

    difference() {
        translate([-20,0,0])
            mirror([0,0,1])
                util_saucer(80,20,6);
        
        translate([-65,0,0])
            cube(100,center=true);
        
        translate([68,0,0])
            cube(100,center=true);
    }

    translate([-15,0,0]) {
        mirror([0,0,1])
            util_saucer(20,20,6);


        util_saucer(20,20,2);
    }

    translate([5,0,0])
        util_nacelle(25,20,3,curved=true);

    util_mirrored([0,1,0])
        translate([-15,10,-5])
            rotate([60,0,0])
                util_nacelle(35,5,12,curved=true,up=false);
}


module model2() {
    difference() {
        util_saucer(80,40,10);

        translate([-50,0,0])
            rotate([0,15,0])
                cube(80,center=true);

        util_mirrored([0,1,0])
            translate([-40,55,-1])
                rotate([-30,0,0])
                    cube(80,center=true);
            
        translate([40,0,0])
            rotate([0,30,0])
                cube(10,center=true);

        translate([35,0,6.4])
            rotate([0,-65,0])
                cube([5,5,7.5],center=true);

    }


    util_mirrored([0,1,0]) 
        translate([-0,11,4])
            rotate([60,0,0])
                util_nacelle(40,8,14,curved=true,up=false);

}

module attack() {
    model2();
}

attack();