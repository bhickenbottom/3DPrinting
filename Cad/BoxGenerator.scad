// Global Options
$fn = 64;

// Options
boxInnerWidth = 30;
boxInnerDepth = 20;
boxInnerHeight = 10;
boxWallThickness = 3;
boxFloorThickness = 3;
includeLid = true;
boxLidThickness = 3;
boxLidPlugThickness = 3;
boxTolerance = 0.25;
boxPieceMargin = 10;
holeRadius = 2;
xDividers = 2;
yDividers = 2;

// Calculations
boxWidth = boxInnerWidth + (boxWallThickness * 2);
boxDepth = boxInnerDepth + (boxWallThickness * 2);
boxInnerWidthMinusTolerance = boxInnerWidth - (boxTolerance * 2);
boxInnerDepthMinusTolerance = boxInnerDepth - (boxTolerance * 2);

// Box
difference()
{    
    union()
    {
        cube([boxWidth, boxDepth, boxFloorThickness], center=false);
        translate([0, 0, boxFloorThickness])
        {        
            cube([boxWallThickness, boxDepth, boxInnerHeight + boxLidPlugThickness], center=false);
        }
        translate([boxInnerWidth + boxWallThickness, 0, boxFloorThickness])
        {        
            cube([boxWallThickness, boxDepth, boxInnerHeight + boxLidPlugThickness], center=false);
        }
        translate([boxWallThickness, 0, boxFloorThickness])
        {        
            cube([boxInnerWidth, boxWallThickness, boxInnerHeight + boxLidPlugThickness], center=false);
        }
        translate([boxWallThickness, boxInnerDepth + boxWallThickness, boxFloorThickness])
        {        
            cube([boxInnerWidth, boxWallThickness, boxInnerHeight + boxLidPlugThickness], center=false);
        }
        translate([boxWallThickness, boxInnerDepth + boxWallThickness, boxFloorThickness])
        {        
            cube([boxInnerWidth, boxWallThickness, boxInnerHeight + boxLidPlugThickness], center=false);
        }
    }    
    translate([-boxWallThickness, boxWallThickness + holeRadius, boxFloorThickness + holeRadius])
    {
        rotate([0, 90, 0])
        { 
            cylinder(boxWallThickness * 3, holeRadius, holeRadius, center=false);
        }
    }
}

// Lid
if (includeLid)
{    
    union()
    {
        translate([0, 0 - boxDepth - boxPieceMargin, 0])
        {        
            cube([boxWidth, boxDepth, boxLidThickness], center=false);
        }
        translate([boxWallThickness + boxTolerance, 0 - boxDepth - boxPieceMargin + boxWallThickness + boxTolerance, boxLidThickness])
        {        
            cube([boxInnerWidthMinusTolerance, boxInnerDepthMinusTolerance, boxLidPlugThickness], center=false);
        }
    }
}

// Dividers (X)
if (xDividers > 1)
{
    xStep = boxInnerWidth / xDividers;
    for (x =[1:xDividers - 1])
    {        
        translate([x * xStep + (boxWallThickness / 2), 0, boxFloorThickness])
        {        
            cube([boxWallThickness, boxDepth, boxInnerHeight], center=false);
        }
    }
}

// Dividers (Y)
if (yDividers > 1)
{
    yStep = boxInnerDepth / yDividers;
    for (y =[1:yDividers - 1])
    {        
        translate([0, y * yStep + (boxWallThickness / 2), boxFloorThickness])
        {        
            cube([boxWidth, boxWallThickness, boxInnerHeight], center=false);
        }
    }
}