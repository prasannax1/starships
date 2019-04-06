module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}

module explorer() {
    resize([60,90,15]) 
    difference(){
        union() {
            sphere(5, $fn=32);
            translate([0,0,-5.5])
                cylinder(5,4,5, $fn=32);
        }
        
        translate([0,0,-11])
        sphere(7, $fn=32);
    }
    
    
    resize([30,45,15])
    difference() {
        hull() {
        translate([0, -10, -10])
            rotate([90,0,0])
                cylinder(40,7.5, 5, $fn=32);
        
        translate([-5,-39,0])
            rotate([0,90,0])
                cylinder(10,0.5,0.5);
            
        translate([0,-50,-10])
            sphere(5, $fn=32);
            
        }
        translate([0,0,-10])
            sphere(12, $fn=32);
    }
    
    mirror_copy([1,0,0])
    union() {
        translate([3,-50,-10])
            rotate([0,50,-30])
                cylinder(27,3,1, $fn=32);
    
        resize([10,60,5])
        union() {
            translate([19,-50,14])
                rotate([90,0,0])
                    cylinder(50,5,5, $fn=32);
    
            translate([19,-50,14])
                sphere(5, $fn=32);
    
            translate([19,-100,14]) 
                sphere(5, $fn=32);
        }
    }
    
    translate([0,-5,0])
    difference() {
        sphere(10);
        translate([0,0,-4])
            cube([20,20,20], center=true);
    }
}

explorer();