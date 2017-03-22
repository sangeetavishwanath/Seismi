//
//  EarthquakesList.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@class Earthquake;

@interface EarthquakesList : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSArray<Earthquake *> *earthquakes;

@end
