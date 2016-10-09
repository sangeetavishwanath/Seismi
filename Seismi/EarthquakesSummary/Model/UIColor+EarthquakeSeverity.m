//
//  UIColor+EarthquakeSeverity.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "UIColor+EarthquakeSeverity.h"

@implementation UIColor (EarthquakeSeverity)

+ (UIColor *)colorForEarthquakeMagnitude:(CGFloat)magnitude
{
    CGFloat greenComponent = (10.0 - magnitude) / 10.0;
    return [UIColor colorWithRed:1 green:greenComponent blue:0 alpha:1];
}

@end
