module util_half_sphere(radius) {
    difference() {
        sphere(radius);
        translate([0,0,-(radius+radius/20)])
            cube(2*radius+radius/10, center=true);
    }
}

util_half_sphere(5);