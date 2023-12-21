// Global Options
$fn = 64;

// Options
outerRadius = 20;
innerRadius = 17;
lipRadius = 25;
holeRadius = 10;
height = 40;
floorThickness = 3;
cutInHalf = false;

// Calculation
maxRadius = max(outerRadius, lipRadius);

// Tube
difference()
{
    union()
    {
        cylinder(height, outerRadius, outerRadius, center=false);
        cylinder(floorThickness, lipRadius, lipRadius, center=false);
    }
    translate([0, 0, floorThickness - 0.01])
    {
        cylinder(height + 0.02, innerRadius, innerRadius, center=false);
    }
    translate([0, 0, -1])
    {
        cylinder(height + 0.02, holeRadius, holeRadius, center=false);
    }
    if (cutInHalf)
    {
        translate([0, -maxRadius, -0.01])
        {
            cube([maxRadius * 2, maxRadius * 2, height + 0.02], center = false);
        }
    }
}