module ms_corner_bar(h, r, n) {
    translate([0,0,(h /2)])
		rotate([90,0,((360/n) /2)])
			cylinder(r, r/100, r/100, $fn = 4);
}


module ms_disk_subtract(h,r,n, core=false) {
    translate([0,0,-(r/2)]) union() {
        mirror([1,0,0])
            rotate([0,0,-((360/n)/2)])
                cube(2*r);

        rotate([0,0,-((360/n)/2)])
            cube(2*r);
        
        if (!core) {
            cylinder(h*4,r/4,r/4);
        }

        translate([-2*r,-2*r, 0])
            cube([r*4,r*2,r*2]);
    }
    
    if (!core) {
        rotate([0,0,180]) {
            ms_corner_bar(h,r,n); 
            mirror([1,0,0]) ms_corner_bar(h,r,n);
            mirror([0,0,1]) ms_corner_bar(h,r,n);
            mirror([0,0,1]) mirror([1,0,0]) ms_corner_bar(h,r,n);
        }
    }
    if (core) {
        translate([0,0,-h*1.25])
            cylinder(h,2*r+1,0);
        
        translate([0,0,-3.15*h])
            cylinder(2*h,2*r+1,2*r+1);
        
    }
    
}

module ms_disk_hangar(h,r,n) {
    difference() {
        translate([0,0,-(h/2)])
            cylinder(h,r,r*.85);

        ms_disk_subtract(h,r,n);
    }
}

module ms_disk_core(h,r,n) {
    difference() {
        translate([0,0,-1.5*h])
            cylinder(2*h, 1.8*r, 0.85*r);
        
        ms_disk_subtract(h,r,n, core=true);
    }
}

module ms_disk(h,r,n) {
    disk_segment_angle = 360/n;
    for(angle=[disk_segment_angle:disk_segment_angle:360-disk_segment_angle])
        rotate(angle)
            ms_disk_hangar(h,r,n);
}


module ms_main(h,r,n) {
    ms_disk(h,r,n);
    ms_ball(h,r,n);
    ms_engg(h,r,n);
}

module ms_ball(h,r,n) {
    sphere_radius = min(1.5*h, r/5);
    sphere(sphere_radius);
}

module ms_engg(h,r,n) {
    ms_disk_core(h,r,n);
    ms_wing(h,r,n);
    mirror([1,0,0]) ms_wing(h,r,n);
    ms_nac_assembly(h,r,n);
    mirror([1,0,0]) ms_nac_assembly(h,r,n);
}

module ms_wing(h,r,n) {
    translate([r/2,r,r/4-h/1.2])
        rotate([-9,-30,0])
            difference() {
                cube([r*.75,r,r/50], center=true);
                
                rotate(-75)
                    translate([-r/4,-1.1*r,-r/2])
                        cube(2*r);
            }
}

module ms_nac_assembly(h,r,n) {
    translate([r*.8,r*1.25,h*.6])
        ms_nacelle(h,r,n);
}

module ms_nacelle(h,r,n) {
    scale([.4,1,.8])
        difference() {
            union () {
                rotate([-90,0,0])
                    cylinder(2*r,h,h*.6, $fn=6);

                sphere(h*1.05, $fn=6);
            }

            translate([-2*r,-2*r,-4*r])
                cube(r*4);

            translate([-r/2,r*1.6,-h/2])
                rotate([-45,0,0])
                    cube (r);
    }
}

module mothership() {
    ms_main(100,400,16);
}

mothership();