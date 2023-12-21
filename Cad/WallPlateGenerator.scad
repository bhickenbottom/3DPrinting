// Global Options
$fn = 64;

// Options
plateThickness = 4;

// Tube
difference()
{
    cube([70, 114, plateThickness], center=true);
    translate([0, 45.8, 0])
    {
        cylinder(plateThickness + 0.01, 3.6, 3.51, center=true);
    }
    translate([0, -45.8, 0])
    {
        cylinder(plateThickness + 0.01, 3.6, 3.51, center=true);
    }
    cube([31.75, 66.04, plateThickness + 0.01], center=true);
}