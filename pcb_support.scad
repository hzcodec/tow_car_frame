include <ruler.scad>

$fn=60;


module rulers() {
    translate([-2, -10, 12]) ruler(20);
}

module pcb_support() {
    //translate([from_left_edge+5, from_back_edge, 0]) cylinder(r=size_of_hole, h=3);
    difference() {
        cylinder(r=4, h=12);
        cylinder(r=1.5, h=12);
    }
}


// *****************************************************
// main
// *****************************************************
//rulers();
//pcb_support();
