//
//  EarthquakesRequest.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class represents a request to retrieve a list of recent earthquakes
 */
@interface EarthquakesRequest : NSObject

/**
 The url for the request
 */
@property (nonatomic, readonly) NSURL *url;

/**
 The request parameters
 */
@property (nonatomic, readonly) NSDictionary *parameters;

@end
