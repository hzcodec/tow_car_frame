// build differential gear support
module gear_box() {
  difference() {
    basic_outer_frame();
    basic_inner_frame();
  }
}

module basic_outer_frame() {
  minkowski() {
    cube([40-4, 56-4, 22.7], true);
    cylinder(r=2,h=1); 
  }
}

module basic_inner_frame() {
  cube([26, 44, 42], true);
}

