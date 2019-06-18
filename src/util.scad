fn1 = 32;
fn2 = 16;

module util_half_sphere(radius, fn=fn1) {
    difference() {
        sphere(radius, $fn=fn);
        translate([0,0,-(radius+radius/19)])
            cube(2*radius+radius/10, center=true);
    }
}

function gcd(a,b) = a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);

module util_saucer(length, width, height) {
    rad = gcd(length,gcd(width,height));
    //rad = 10;
    scale([length/(2*rad), width/(2*rad), height/rad])
        util_half_sphere(rad);
}

module util_half_cylinder(length, radius, inner_fn=fn2, outer_fn=fn1) {
    maxval = max(length, 2*radius);
    intersection() {
        difference() {
            rotate([0,90,0])
                translate([0,0,-(length/2 + length/20)])
                    cylinder(length+length/10, radius, radius, $fn=inner_fn);
            
            translate([0,0,(maxval/2 + maxval/19)])
                cube(maxval+maxval/10, center=true);
        }
        
        translate([0,0,-(radius+radius/20)])
            cylinder(radius + radius/10, length/2, length/2, $fn=outer_fn);
    }
}

module util_body(length, width, height, upper_height) {
    rad = gcd(length, gcd(width, upper_height));
    
    scale(.995) scale([length/(2*rad), width/(2*rad), 1])
        util_half_cylinder(2*rad, height);
}

