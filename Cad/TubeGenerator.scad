// Options
outerRadius = 20;
innerRadius = 17;
height = 40;
floorThickness = 3;

// Tube
difference()
{
    cylinder(height, outerRadius, outerRadius, center=false, $fn = 32);      
    translate([0, 0, floorThickness])
    {
        cylinder(height, innerRadius, innerRadius, center=false, $fn = 32);
    }
}