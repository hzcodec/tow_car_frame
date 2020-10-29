module ruler(length)
{
    mark_width = 0.125;
    mark_depth = 0.05;

    difference()
    {
        color([1, 0, 0])
        cube( [1, length, 8 ] );
        for ( i = [1:length-1] )
        {
            translate( [mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
            translate( [-mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
            if (i % 5 == 0)
            {
                translate( [mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
                translate( [-mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
            }
            if (i % 10 == 0)
            {
                translate( [mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
                translate( [-mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
            }
        }
    }
}

//rotate([0,0,90]) ruler(200);
//translate([0, 0, 0]) cube([4, 21, 2]);

