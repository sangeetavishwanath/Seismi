//
//  UIColor+EarthquakeSeverity.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  A category on UIColor with convenience methods for Earthquake severity
 */
@interface UIColor (EarthquakeSeverity)

/**
 *  A color representing the earthquake magnitude
 *
 *  @param magnitude The earthquake magnitude
 *
 *  @return A color representing the earthquake magnitude
 */
+ (UIColor *)colorForEarthquakeMagnitude:(CGFloat)magnitude;

@end
