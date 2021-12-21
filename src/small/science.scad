use <../lib/util.scad>;


module sci_saucer() {
    difference() {
        scale([1,1,1])
        translate([0,0,-3])
        util_saucer_shape(40, 6, 1, 0, 1);

        cube([100,100,.5], center=true);
    }

    cylinder(center=true, h=1, d=33);
}
    
module sci_body_plus() {
    translate([0,0,3-.01]) {
    translate([0,0,1.5+.75-.01])
    cylinder(h=1.5,d1=12,d2=9,center=true, $fn=64);
    cylinder(h=3,d=12,center=true, $fn=64);
    }
    
    translate([0,0,-3])
    scale([48/9,1,1])
    difference(){ 
    rotate([90,0,0]) {
    util_mirrored([0,0,1])
    translate([0,0,4.5+.75-.01])
    cylinder(h=1.5, r1=9, r2=9-1.5, center=true, $fn=64);
    cylinder(r=9,h=9,center=true,$fn=64);
    }
    
    translate([250,0,0])
    cube(500,center=true);
    
    translate([0,0,-250])
    cube(500,center=true);
}

translate([0,0,-3])
difference() {
rotate([0,-90,0]) {
translate([0,0,.5*(48-(1.5*48/9))])
cylinder(h=48-(1.5*48/9), d=12, center=true, $fn=64);

translate([0,0,48-(.5*1.5*48/9)])
cylinder(h=1.5*48/9, d1=12, d2=9, center=true, $fn=64);
}

translate([0,0,250+.01])
cube(500, center=true);
}
}


module science() {
    sci_saucer();

    sci_body();
        
    sci_assembly();
}

module sci_assembly() {
util_mirrored([0,1,0])
translate([-40,12, 4.5]) sci_nacelle();

util_mirrored([0,1,0])
translate([-28,0,-3]) {
rotate([-65,0,0])
{
util_mirrored([1,0,0])
translate([3,0,7.5])
cylinder(d=3, h=15, center=true, $fn=64);

translate([0,0,7.5])
cube([6,2,15], center=true);
}
}
}

module sci_body() {
difference() {
sci_body_plus();

translate([0,0,6])
cylinder(h=.5, d=8, center=true, $fn=64);
    
    translate([0,0,-9])
rotate([90,0,0])
cylinder(h=32, r=6, center=true, $fn=64);
    
    translate([0,0,-3])
rotate([0,90,0])
cylinder(d=10, h=12, center=true, $fn=64);
    
    translate([-48,0,-9])
scale([2.5,1,1])
rotate([90,0,0])
cylinder(h=32, r=6, center=true, $fn=64);
    
            translate([-48,0,0])
            hull()
            util_mirrored([0,0,1])
            util_mirrored([0,1,0])
            translate([0,3.2,1.5])
            rotate([0,90,0])
            cylinder($fn=8, d=2, h=24, center=true);
}

translate([-6,0,-3])
sphere(d=8, $fn=64);
}

module sci_nacelle() {
difference() {
hull()
util_mirrored([1,0,0])
translate([20,0,0]) {
cylinder(h=3, d=6, center=true, $fn=64);

translate([0,0,1.5])
sphere(d=6, $fn=64);


translate([0,0,-3+.01])
cylinder(h=3,d1=3,d2=6,center=true, $fn=64);
}

util_mirrored([0,1,0])
translate([0,3,0])
rotate([0,90,0])
cylinder(h=36, d=1.5, center=true, $fn=64);
}
}

science();



