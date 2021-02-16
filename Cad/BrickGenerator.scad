// Options
x = 2;
y = 1;
pegTolerance = -0.1;
holeTolerance = 0.1;

// Calculations
halfPegTolerance = pegTolerance / 2;
halfHoleTolerance = holeTolerance / 2;

// Brick
union()
{
    for (xi = [0: x - 1])
    {
        for (yi = [0: y - 1])
        {
            translate([7.95 * xi, 7.9 * yi, 0])
            {
                difference()
                {                    
                    union()
                    {
                        cube([7.95, 7.9, 9.6]);
                        translate([3.9, 3.9, 9.6])
                        {
                           cylinder(1.8, 2.4 - pegTolerance, 2.4 - pegTolerance, center=false, $fn=64);
                        }                    
                    }
                    union()
                    {
                        translate([3.9, 3.9, -0.01])
                        {
                            rotate(a=45, v=[0,0,1])
                            {
                                cylinder(1.8 * 2, 3.39 + holeTolerance, 3.39 + holeTolerance, center=false, $fn=4);
                            }
                        }
                        translate([3.9, 3.9, (1.8 * 2) - 0.02])
                        {      
                            rotate(a=45, v=[0,0,1])
                            {
                                cylinder(5, 3.39 + holeTolerance, 0, center=false, $fn=4);
                            }
                        }
                    }
                }
            }
        }
    }
}