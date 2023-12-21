// Global Options
$fn = 64;

// Options
outerRadius = 23;
innerRadius = 20;
straightLength = 20;
bendAngle = 30;
bendRadius = 25;

// Tube
translate([0 - bendRadius, 0, straightLength])
{
    rotate([90, 0, 0])
    {
        difference()
        {
            rotate_extrude(angle = bendAngle)
            {
                translate([bendRadius, 0, 0])
                {
                    circle(outerRadius);
                }
            }
            rotate_extrude(angle = bendAngle + 0.1)
            {
                translate([bendRadius, 0, 0])
                {
                    circle(innerRadius);
                }
            }
            rotate_extrude(angle = -0.1)
            {
                translate([bendRadius, 0, 0])
                {
                    circle(innerRadius);
                }
            }
        }
        difference()
        {
            translate([bendRadius, 0, 0])
            {
                rotate([90, 0, 0])
                {
                    cylinder(straightLength, outerRadius, outerRadius, center=false);
                } 
            }
            translate([bendRadius, 0, 0])
            {
                rotate([90, 0, 0])
                {
                    translate([0, 0, -1])
                    {
                        cylinder(straightLength + 2, innerRadius, innerRadius, center=false);
                    }
                } 
            }
        }
        difference()
        {
            rotate([0, -90, bendAngle - 90])
            {
                translate([0, bendRadius, 0])
                {
                    cylinder(straightLength, outerRadius, outerRadius, center=false);
                }
            }
            rotate([0, -90, bendAngle - 90])
            {
                translate([0, bendRadius, 0])
                {
                    translate([0, 0, -1])
                    {
                        cylinder(straightLength + 2, innerRadius, innerRadius, center=false);
                    }
                }
            }
        }
    }
}