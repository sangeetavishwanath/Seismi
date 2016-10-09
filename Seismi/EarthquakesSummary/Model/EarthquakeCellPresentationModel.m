//
//  EarthquakeCellPresentationModel.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakeCellPresentationModel.h"
#import "Earthquake.h"
#import "UIColor+EarthquakeSeverity.h"

static NSString *const kEarthquakeCellIdentifier = @"earthquakeCell";

@implementation EarthquakeCellPresentationModel

- (instancetype)initWithEarthquake:(Earthquake *)earthquake
{
    self = [super init];

    if (self) {
        _cellIdentifier = kEarthquakeCellIdentifier;
        _titleText = earthquake.regionName;
        _subtitleText = [NSString stringWithFormat:@"%@, %@", earthquake.latitude, earthquake.longitude];
        _accessoryText = [NSString stringWithFormat:@"%@", earthquake.magnitude];
        _cellColor = [UIColor colorForEarthquakeMagnitude:[earthquake.magnitude floatValue]];
    }

    return self;
}

@end
