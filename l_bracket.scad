include <ruler.scad>
include <triangle.scad>

$fn=60;

module base_plate() {
  	cube([51.5, 37.5, 2]);
}

module oval_hole() {
	translate([-5, 14, 0])
	hull() {
		translate([13, 0, 0]) cylinder(r=5, h=2);
		cylinder(r=5, h=2);
	}
}

module l_plate() {
	difference() {
		rotate([0, 0, 0]) cube([37.5, 37.5, 2]);
		translate([20, 5, 0]) oval_hole();
	}
}


module rulers() {
	// ruler for witdh
	translate([0, 0, 0]) ruler(40);
	// ruler for length
	translate([60, 0, 0]) rotate([0, 0, 90]) ruler(60);
}

module l_bracket() {
	base_plate();
	rotate([0, -90, 0]) l_plate();
}

// *****************************************************
// main
// *****************************************************

//rulers();
//l_bracket();
