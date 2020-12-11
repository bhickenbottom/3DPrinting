// Options
outerRadius = 10;
innerRadius = 7;
length = 30;
floorThickness = 3;

// Tube
difference()
{
    cylinder(length, outerRadius, outerRadius, center=false, $fn = 32);        
    translate([0, 0, floorThickness])
    {
        cylinder(length, innerRadius, innerRadius, center=false, $fn = 32);
    }
}