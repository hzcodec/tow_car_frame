include <ruler.scad>
include <triangle.scad>
include <l_bracket.scad>
include <bat_holder.scad>
include <diff_gear_box.scad>
include <pcb_support.scad>

$fn=60;

module rulers() {
    // ruler for length of base plate
    translate([100, 0, -10]) ruler(200);

    // ruler for width of base plate
    //translate([0, 100, 5]) rotate([90, 90, 0]) ruler(110);

    // ruler for hight of gear box
    //translate([34, 10, 3]) rotate([90, 0, 0]) ruler(30);
}


base_plate_width = 110;
base_plate_length = 200;
extend_rear_base_plate = 0;

// ================================================================================================
module base_plate() {
    trailer_shoe_support_with_hole();

    translate([33, 90, 0]) l_bracket_guides();

    translate([95, 70, -12]) pcb_support();
    translate([95, 120, -12]) pcb_support();

    difference() {
        cube([base_plate_width, base_plate_length, 3]);
        hole_for_rfid_cable();
        hole_for_rfid_pcb();
        hole_for_motor_cable();
        hole_for_switches();
        hole_for_gnd_skrew();
        hole_for_foot_support();
        guide_holes_for_middle_pos();
        diff_gear_block_holes();
    }

    difference() {
        translate([base_plate_width/2, 35, 13]) gear_box();
        diff_gear_block_holes();
    }

    // extend base plate at rear side
    translate([0, -extend_rear_base_plate, 0]) cube([base_plate_width, extend_rear_base_plate, 3]);

    // rear stopper and battery wall
    #translate([0, 0, -15]) cube([base_plate_width, 3, 30]);
    #translate([10, 26, -15]) cube([base_plate_width-20, 3, 15]);
    #translate([10, 40, -15]) cube([base_plate_width-20, 3, 15]);
}
// ================================================================================================

module hole_for_rfid_cable() {
	from_back_edge = 140;
    from_left_edge = 3;
	size_of_hole = 2.5;

	color([1, 0, 0])
	hull() {
		translate([from_left_edge+5, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
		translate([from_left_edge+27, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
	}
}

module hole_for_rfid_pcb() {
	from_back_edge1 = 70;
	from_left_edge1 = 23;

	from_back_edge2 = 107;
	from_left_edge2 = 21;
	size_of_hole = 1.5;

	translate([from_left_edge1, from_back_edge1, 0]) cylinder(r=size_of_hole, h=3);
	translate([from_left_edge2, from_back_edge2, 0]) cylinder(r=size_of_hole, h=3);
}

module hole_for_motor_cable() {
	from_back_edge = 120;
	from_left_edge = 15;
	size_of_hole = 5;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
}

module hole_for_switches() {
	from_back_edge = base_plate_length-40;
	from_left_edge = base_plate_width-15;
	size_of_hole = 3;

	color([1, 0, 1])
	translate([from_left_edge, from_back_edge-6, 0]) cylinder(r=size_of_hole, h=3);
	translate([from_left_edge, from_back_edge+12, 0]) cylinder(r=size_of_hole, h=3);

    // cable hole for motor
	translate([from_left_edge, from_back_edge-20, 0]) cylinder(r=size_of_hole-1, h=3);
}

module hole_for_gnd_skrew() {
	from_back_edge = 50;
	from_left_edge = base_plate_width-10;
	size_of_hole = 1.5;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
}

module hole_for_foot_support() {
	from_back_edge = base_plate_length-10;
	from_left_edge =base_plate_width/2 ;
	size_of_hole = 2;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
}

module guide_holes_for_middle_pos() {
	from_back_edge = 80;
	from_left_edge =base_plate_width/2 ;
	size_of_hole = 1.5;
	color([1, 0.5, 0.5])
	translate([from_left_edge, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
	translate([from_left_edge, from_back_edge+80, 0]) cylinder(r=size_of_hole, h=3);
}

module diff_gear_block_holes() {
    x1 = base_plate_width/2 - 16.5;
    x2 = base_plate_width/2 + 16.5;

    translate([x1, 10, 0]) cylinder(d=5, h=26);
    translate([x1, 58, 0]) cylinder(d=5, h=26);

    translate([x2, 10, 0]) cylinder(d=5, h=26);
    translate([x2, 58, 0]) cylinder(d=5, h=26);
}

module version_text() {
	color([.6, .7, .6])
	mirror([0, 1, 0])
	translate([5, -10, -1.5]) {
		linear_extrude(height=2) {
			text(content, font=font, size=5);
		}
	}
}

module trailer_shoe_support_with_hole() {
  x_pos = base_plate_width/2-10;
  y_pos = base_plate_length - 16;
  z_pos = 3;

  difference() {
      foot_support_height = 5;
      color([.7, .5, .2])
      translate([x_pos, y_pos, z_pos]) cube([20, 12, foot_support_height]);

      size_of_hole = 2;
      color([1, 0.5, 0.5])
      translate([x_pos+10, y_pos+6, z_pos]) cylinder(r=size_of_hole, h=foot_support_height);
  }
}

module l_bracket_guides() {
	x_pos1 = 0;  // left support
	y_pos = 0;
	z_pos1 = 0;
	x_pos2 = 41;  // right support
	z_pos2 = 0;

	color([0.6, 0.7, 0.2])
	translate([x_pos1, y_pos, z_pos1]) cube([3, 40, 5]);
	color([0.6, 0.7, 0.2])
	translate([x_pos2, y_pos, z_pos2]) cube([3, 40, 5]);
}
// ================================================================================================


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


// *****************************************************
// main
// *****************************************************
//rulers();
base_plate();
content = "RE";
font = "Liberation Sans";
version_text();

