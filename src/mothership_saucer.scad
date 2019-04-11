module mss_saucer() {
  difference() {
    sphere(7.5);
    mss_minus();
  }
}

module mss_minus() {
  translate([-10,-10,-15])
    cube(20);

  translate([0,0,0.85])
    cube ([20,7,10], center=true);

  translate([-12,0,0])
    cube([20,7,20], center=true);
}

module mss_saucer_main() {
  scale(10) mss_saucer();
}

mss_saucer_main();
