include <ruler.scad>

$fn=60;

bat_holder_length = 56;
bat_holder_width = 32;
bat_holder_hight = 4;


module basic_outer_frame() {
    cube([bat_holder_length, bat_holder_width, bat_holder_hight], true);
}

module basic_inner_frame() {
    cube([bat_holder_length-5, bat_holder_width-5, bat_holder_hight], true);
}

module bat_holder() {
  difference() {
    basic_outer_frame();
    basic_inner_frame();
  }
}

hold_length = 5;
hold_width = 2.5;
hold_hight = 17;

module left_holder() {
    translate([0, -14.75, 7]) cube([hold_length, hold_width, hold_hight], true);
    translate([0, -11, 17]) cube([5, 10, 3], true);
}

module right_holder() {
    translate([0, 14.75, 7]) cube([hold_length, hold_width, hold_hight], true);
    translate([0, 11, 17]) cube([5, 10, 3], true);
}

module end_stop() {
    translate([-26.75, 0, 4]) cube([2.5, 32, 8], true);
}


// *****************************************************
// main
//translate([15, 50, -10]) rotate([90, 0, 0]) ruler(30);
// *****************************************************
// ruler for length
//translate([28, bat_holder_width/2, -10]) rotate([0, 0, 90]) ruler(bat_holder_length);
//translate([28, bat_holder_width/2-5, 0]) rotate([0, 0, 90]) ruler(bat_holder_length);
//
//translate([28, -16, -10]) ruler(bat_holder_width);
//translate([23, -16, 2]) ruler(bat_holder_width);

//translate([0, -11, -2.5]) rotate([90, 0, 90]) ruler(18);

//48,5 x 26,5 x 17,5 mm

bat_holder();
left_holder();
right_holder();
end_stop();

