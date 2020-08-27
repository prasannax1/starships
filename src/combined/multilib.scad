use <../mother/mlib.scad>;

module repeat(num, tv=[0,0,0], rv=[0,0,0]) {
    for(x = [0:1:num-1  ]) {
        rotate(rv*x) translate(tv*x)  children();
    }
}

