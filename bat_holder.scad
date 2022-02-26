include <ruler.scad>

$fn=60;

bat_holder_length = 24;
bat_holder_width = 32;
bat_holder_hight = 26;


module bat_holder_outer_frame() {
    cube([bat_holder_length, bat_holder_width, bat_holder_hight], true);
}

module bat_holder_inner_frame() {
    cube([bat_holder_length-3, bat_holder_width-3, bat_holder_hight], true);
}

module bat_holder() {
  difference() {
    bat_holder_outer_frame();
    bat_holder_inner_frame();
  }
}


module battery_case() {
	bat_holder();
}

// *****************************************************
// main
//translate([15, 50, -10]) rotate([90, 0, 0]) ruler(30);
// *****************************************************
//translate([12, -17, 0]) rotate([0, 0, 90]) ruler(30);
//translate([12.2, -24, 0]) rotate([0, 90, 0]) ruler(40);


//translate([28, -16, -10]) ruler(bat_holder_width);
//translate([23, -16, 2]) ruler(bat_holder_width);

//translate([0, -11, -2.5]) rotate([90, 0, 90]) ruler(18);

//48,5 x 26,5 x 17,5 mm
//battery_case();

