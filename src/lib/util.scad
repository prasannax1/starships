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

module util_saucer(length, width, height, fn=fn1) {
    rad = gcd(length,gcd(width,height));
    //rad = 10;
    scale([length/(2*rad), width/(2*rad), height/rad])
        util_half_sphere(rad, fn);
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

module util_body(length, width, height, upper_height, fn=fn1) {
    rad = gcd(length, gcd(width, upper_height));
    
    scale(.995) scale([length/(2*rad), width/(2*rad), 1])
        util_half_cylinder(2*rad, height, outer_fn=fn);
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
                        rotate([0,90,0]) rotate(90) sphere(rad, $fn=6);
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

module util_ring(outer, inner, height, fn=fn1) {
    difference() {
        translate([0,0,-height/2])
            cylinder(height, outer, outer, $fn=fn);
        translate([0,0,-(height/2 + height/19)])
            cylinder(height+height/10, inner, inner, $fn=fn);
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

module util_ring_star(radius, thick, num, inner, half=false) {
    outer=inner+thick;
    avg = (inner + outer)/2;
    union() {
        difference() {
            util_star(radius, thick, num, half);
            cylinder(2*thick, outer, outer, $fn=num, center=true);
        }
        util_ring(outer, inner, thick);
    }
}

module util_hangar_disk(height, lower, upper, num, fn=fn1) {
    difference() {
            cylinder(height, lower, upper, $fn=fn, center=true);
        difference() {
            scale([1,1,22])
                util_star(1.1*upper, height/20, num, half=true);
            scale(.95)
                cylinder(height, lower, upper, $fn=fn, center=true);
        }
    }
}

module util_hangar_form(length, width, height, num, inner=0) {
    l = 0.6* max(length, width);
    h = 2.5* height;
    thick = min(height/20,1);
    inner = inner == 0 ? l/3 : inner;
    difference() {
        children();
        scale([1,1,h/thick]) 
            util_ring_star(l, thick, num, inner, half=true);
    }
    scale(.95) children();
}

module util_nacelle_bar(span, height, width, thickness, faces=fn1) {
    rad = (span*span/(8*height) + height/2);
    outer = rad + thickness/2;
    inner = rad - thickness/2;
    difference(){
        translate([0,0,outer])
            rotate([0,90,0])
                util_ring(outer, inner, width, fn=faces);
    
        translate([0,0,1.1*outer+height])
            cube(2.2*outer, center=true);
    }
}

module util_q_sphere(rad, quadrant, faces) {
    x_sign = quadrant == 1 ? 1 :
             quadrant == 2 ? -1 :
             quadrant == 3 ? -1 :
             quadrant == 4 ? 1 : 0;
    z_sign = quadrant == 1 ? 1 :
             quadrant == 2 ? 1 :
             quadrant == 3 ? -1 :
             quadrant == 4 ? -1 : 0;
    
    difference() {
        sphere(rad, $fn=faces);

        translate([x_sign*(-1.1*rad - .01),0,0])
        cube(2.2*rad, center=true);

        translate([0,0,z_sign*(-1.1*rad - .01)])
        cube(2.2*rad, center=true);
    }
}

module util_ovoid(front_rad, back_rad, width, upper_rad, lower_rad, faces=32) {
    half_width = width/2;
    largest=max(front_rad, back_rad, half_width, upper_rad, lower_rad);
    smallest=min(front_rad, back_rad, half_width, upper_rad, lower_rad);
    
    union() {
        scale([front_rad/smallest, half_width/smallest, upper_rad/smallest])
        util_q_sphere(smallest, 1, faces);
        
        scale([front_rad/smallest, half_width/smallest, lower_rad/smallest])
        util_q_sphere(smallest, 4, faces);
        
        scale([back_rad/smallest, half_width/smallest, lower_rad/smallest])
        util_q_sphere(smallest, 3, faces);
        
        scale([back_rad/smallest, half_width/smallest, upper_rad/smallest])
        util_q_sphere(smallest, 2, faces);
    }
}
