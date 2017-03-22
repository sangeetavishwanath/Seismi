//
//  Earthquake.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Earthquake : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *source;
@property (nonatomic, readonly, copy) NSString *earthquakeId;
@property (nonatomic, readonly) NSDate *earthquakeTime;
@property (nonatomic, readonly) NSDecimalNumber *latitude;
@property (nonatomic, readonly) NSDecimalNumber *longitude;
@property (nonatomic, readonly) NSDecimalNumber *magnitude;
@property (nonatomic, readonly) NSDecimalNumber *depth;
@property (nonatomic, readonly, copy) NSString *regionName;

@end
