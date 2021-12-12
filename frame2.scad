include <ruler.scad>
include <triangle.scad>
include <l_bracket.scad>
include <bat_holder.scad>

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

module hole_for_rfid_cable() {
	from_front_edge = 120;
	size_of_hole = 2.5;
	color([1, 0, 0])
	hull() {
		translate([-45, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
		translate([-20, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
	}
}

module hole_for_switch() {
	from_front_edge = 120;
	from_left_edge = 40;
	size_of_hole = 3;
	color([1, 0, 0])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

module hole_for_switch2() {
	from_front_edge = 100;
	from_left_edge = 40;
	size_of_hole = 3;
	color([1, 0, 0])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

module hole_for_motor_cable() {
	from_front_edge = 100;
	from_left_edge = -40;
	size_of_hole = 4;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

module hole_for_earth_skrew() {
	from_front_edge = -10;
	from_left_edge = 45;
	size_of_hole = 1.5;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

// above foot support 
module hole_for_middle_position() {
	from_front_edge = 130;
	from_left_edge = 0;
	size_of_hole = 2;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

// close to wheel support
// used to make it easy to line up middle pos
module guide_hole1_middle_pos() {
	from_front_edge = 40;
	from_left_edge = 0;
	size_of_hole = 1;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

// used to make it easy to line up middle pos
module guide_hole2_middle_pos() {
	from_front_edge = 100;
	from_left_edge = 0;
	size_of_hole = 1;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

module hole_for_reset_switch() {
	from_front_edge = 115;
	from_left_edge = 0;
	size_of_hole = 3;
	color([1, 0, 0])
	translate([from_left_edge, from_front_edge, -13]) cylinder(r=size_of_hole, h=3);
}

module hole_for_rfid_board() {
	bottom_holes_y = 77;
	left_holes_x1 = -31;
	left_holes_x2 = -27;
	top_holes_y = 40;

	from_front_edge2 = bottom_holes_y;
	from_front_edge3 = top_holes_y;
	from_left_edge3 = left_holes_x1;
	from_left_edge2 = left_holes_x2;

	size_of_hole = 1.5;
	color([0.5, 0.6, 0.7])
//	translate([from_left_edge1, from_front_edge1, -13]) cylinder(r=size_of_hole, h=3);
	translate([from_left_edge2, from_front_edge2, -13]) cylinder(r=size_of_hole, h=3);
	translate([from_left_edge3, from_front_edge3, -13]) cylinder(r=size_of_hole, h=3);
//	translate([from_left_edge4, from_front_edge4, -13]) cylinder(r=size_of_hole, h=3);
}

module frame_with_holes() {
  difference() {
    frame2();
    hole_for_rfid_cable();
    hole_for_switch();
    hole_for_switch2();
    hole_for_rfid_board();
    hole_for_motor_cable();
    hole_for_earth_skrew();
    hole_for_middle_position();
    guide_hole1_middle_pos();
    guide_hole2_middle_pos();
    hole_for_reset_switch();
    translate([16.5, -24, -14]) cylinder(d=5, h=26);
    translate([16.5, 24, -14]) cylinder(d=5, h=26);
    translate([-16.5, -24, -14]) cylinder(d=5, h=26);
    translate([-16.5, 24, -14]) cylinder(d=5, h=26);
  }
}

// side support at motor support
module support() {
    color([0, 1, 1])
    translate([15, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    color([0, 1, 0])
    translate([-20, 27, -10]) rotate([90, 0, 90]) triangle(15, 35, 5);

    translate([15, 38, -11]) cube([5, 70, 10]);
    translate([-20, 38, -11]) cube([5, 70, 10]);
}

// middle support for motor
module motor_support() {
  motor_support_height = 8;
  color([1, 0, 1])  // purple
  difference() {
  	translate([-15, 58, -10]) cube([30, 50, motor_support_height]);
	size_of_hole = 0.5;
	color([0, 0.8, 0.5])
	translate([0, 100, 0]) cylinder(r=size_of_hole, h=4);
  }
}

// support for trailer shoe at the front 
module trailer_shoe_support_with_hole() {
  x_pos = -10;
  y_pos = 124;
  z_pos = -10;
  difference() {
      foot_support_height = 5;
      color([.7, .5, .2])  // brown 
      translate([x_pos, y_pos, z_pos]) cube([20, 12, foot_support_height]);

      size_of_hole = 2;
      color([1, 0.5, 0.5])
      translate([x_pos+10, y_pos+6, z_pos]) cylinder(r=size_of_hole, h=foot_support_height);
  }
}

module axis_support() {
	hight_for_support = 22;
	width = 5;
	x = 5;

	color([1, 0.5, 0.5])
	translate([20, -2.5, -10]) cube([x, width, hight_for_support]);

	mirror([1, 0, 0])
	color([1, 0.5, 0.5])
	translate([20, -2.5, -10]) cube([x, width, hight_for_support]);
}

// side support
module upper_support() {
  color([.6, .7, .6])  // grey
  translate([50, 0, -18]) cube([5, 110, 5]);

  color([.6, .7, .6])
  translate([-55, 0, -18]) cube([5, 110, 5]);
}

module fixed_2_supports() {
  rotate([0, 180, 0])
  translate([15, 27, -5]) support();
  
  rotate([0, 180, 0])
  translate([-20, 27, -5]) support();
}

module version_text() {
	color([.6, .7, .6])
	mirror([0, 1, 0])
	translate([40, -135, -14]) {
		linear_extrude(height=1) {
			text(content, font=font, size=5);
		}
	}
}



// *****************************************************
// main
// *****************************************************
// ruler for length
//translate([25, -30, -10]) ruler(170);

// ruler for width, move y value
//translate([-55, 130, -9]) rotate([90, 90, 0]) ruler(110);

// ruler at wheels
//translate([-55, 0, -9]) rotate([90, 90, 0]) ruler(110);

// ruler for motor support
//translate([15, 50, -10]) rotate([90, 0, 0]) ruler(30);

//translate([15, 28, -10]) ruler(112);

frame_with_holes();

upper_support();
trailer_shoe_support_with_hole();
axis_support();

translate([0, 0, -15]) rotate([0, 180, 0]) battery_case();

content = "RC";
font = "Liberation Sans";
version_text();

// Just to see the l-bracket position.
// Do not include this in the 3D printout.
//color([1, 0, 0])
///translate([18, 60, -10]) rotate([0, 0, 90]) l_bracket();

