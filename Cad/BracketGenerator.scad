// Global Options
$fn = 64;

// Options
width = 10;
length1 = 20;
length2 = 40;
thickness1 = 4;
thickness2 = 2;
holeRadius1 = 1;
holeOffset1 = 6;
holeRadius2 = 2;
holeOffset2 = 4;

// Tube
difference()
{
    union()
    {
        cube([length1, thickness1, width], center=false);
        cube([thickness2, length2, width], center=false);
    }
    union()
    {
        translate([length1 - holeOffset1 - holeRadius1, thickness1 + 0.01, width / 2])
        {
            rotate([90, 0, 0])
            {
                cylinder(thickness1 + 0.02, holeRadius1, holeRadius1, center=false);
            }
        }
        translate([thickness2 + 0.01, length2 - holeOffset2 - holeRadius2, width / 2])
        {
            rotate([0, -90, 0])
            {
                cylinder(thickness2 + 0.02, holeRadius2, holeRadius2, center=false);
            }
        }
    }
}