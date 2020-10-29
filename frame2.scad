include <ruler.scad>
include <triangle.scad>

$fn=60;

module basic_outer_frame() {
  minkowski() {
    cube([40-4, 56-4, 20], true);
    cylinder(r=2,h=1); 
  }
}

module basic_inner_frame() {
  cube([26, 44, 40], true);
}

module frame() {
  difference() {
    basic_outer_frame();
    basic_inner_frame();
  }
}

module frame2() {
  frame();
  translate([-55, -30, -13]) cube([110, 170, 3]);
}

module frame_with_holes() {
  difference() {
    frame2();
    translate([16.5, -24, -14]) cylinder(d=5, h=26);
    translate([16.5, 24, -14]) cylinder(d=5, h=26);
    translate([-16.5, -24, -14]) cylinder(d=5, h=26);
    translate([-16.5, 24, -14]) cylinder(d=5, h=26);
  }
}

module support() {
    color([0, 1, 1])
    translate([15, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    color([0, 1, 0])
    translate([-20, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    translate([15, 38, -11]) cube([5, 70, 10]);
    translate([-20, 38, -11]) cube([5, 70, 10]);
}

module motor_support() {
  color([1, 0, 1])
  translate([-15, 48, -10]) cube([30, 60, 99]);
}

module upper_support() {
  color([.6, .7, .6])
  translate([50, 0, -18]) cube([5, 110, 5]);

  color([.6, .7, .6])
  translate([-55, 0, -18]) cube([5, 110, 5]);
}

module diff2 () {
  difference() {
    translate([20, 0, 0])
    cube([5,65,15]);
    c = 70;
    rotate([-75, 0, 0]) cube([c, c, c]); 
  }
}

module fixed_2_supports() {
  rotate([0, 180, 0])
  translate([15, 27, -5]) support();
  
  rotate([0, 180, 0])
  translate([-20, 27, -5]) support();
}


// *****************************************************
// main
// *****************************************************
//translate([0, -30, -10]) ruler(170);
//translate([15, 28, -10]) ruler(112);
//translate([15, 50, -10]) rotate([90, 0, 0]) ruler(30);

frame_with_holes();
support(); 
motor_support();
upper_support();

