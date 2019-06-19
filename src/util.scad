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

module util_graded_cylinder(height, radius_start, radius_end, grades=1, fn=fn1) {
    height_grade = height / grades;
    radius_grade = (radius_start - radius_end) / (grades * grades);
    for (i = [0 : 1 : grades]) {
        translate([0,0,i*height_grade])
            cylinder(height_grade, 
                     radius_start - i*radius_grade * i,
                     radius_start - (i+1) * radius_grade * (i+1),
                     $fn = fn);
    }
}

module util_nacelle(length, width, height, curved=false, up=true, front_bulge=false) {
    rad = min(width, height/2);
    grads = curved ? 6 : 1;
    scale_factor = front_bulge ? 1.1 : 1;
    direction = up ? -1 : 1;
    difference() {
        scale([1, width/ (2*rad), height/rad])
            difference() {
                union() {
                    rotate([0,-90,0])
                        rotate(30)
                            util_graded_cylinder(length-rad, rad, rad/2, grads, 6);
                    scale(scale_factor) 
                        sphere(rad, $fn=6);
                }
                
                translate([-length/2, 0, direction * (height/2 + height/19)])
                    cube([length+length, width+width, height+height/10], center=true);
            }
        
        translate([-length-(curved?length/3:0), 0, -length/3])
            rotate([0,-45,0])
                cube(length, center=true);
    }
}

module util_mirrored(v) {
    children();
    mirror(v) children();
}

module util_ring(outer, inner, height) {
    difference() {
        translate([0,0,-height/2])
            cylinder(height, outer, outer);
        translate([0,0,-(height/2 + height/19)])
            cylinder(height+height/10, inner, inner);
    }
}

module util_star(radius, thick, num, half=false) {
    angle = 360/num;
    offset = half? angle/2 : 0;
    for (i = [0: 1: num]) {
        rotate(i* angle + offset)
            translate([radius/2,0,0])
                cube([radius, thick, thick], center=true);
    }
}

module util_hangar_disk(height, lower_rad, upper_rad, num, fn=fn1) {
    difference() {
        translate([0,0,-height/2])
            cylinder(height, lower_rad, upper_rad, $fn=fn);        
        translate([0,0,height/2])
            util_star(upper_rad, height/20, num, half=true);
        translate([0,0,-height/2])
            util_star(lower_rad, height/20, num, half=true);
        
    }
}
