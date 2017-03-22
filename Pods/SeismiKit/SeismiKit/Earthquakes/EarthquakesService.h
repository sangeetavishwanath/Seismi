//
//  EarthquakesService.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EarthquakesList;
@class EarthquakesService;

/**
 This protocol defines methods to notify delegates of the earthquake retrieval status
 */
@protocol EarthquakesServiceDelegate <NSObject>

/**
 Use this method to notify delegates of the successful retrieval of earthquakes

 @param service        The EarthquakesService notifying the delegate
 @param earthquakeList The list of earthquakes retrieved
 */
- (void)earthquakesService:(EarthquakesService *)service didRetrieveEarthquakes:(EarthquakesList *)earthquakeList;

/**
 Use this method to notify delegates of a failure in retrieving earthquakes

 @param service    The EarthquakesService notifying the delegate
 @param error      The error encountered
 */
- (void)earthquakesService:(EarthquakesService *)service didFailToRetrieveEarthquakesWithError:(NSError *)error;

@end

/**
 This class encapsulates the logic to retrieve earthquake information
 */
@interface EarthquakesService : NSObject

/**
 The delegate to send earthquake retrieval information to
 */
@property (nonatomic, weak) id<EarthquakesServiceDelegate> delegate;

/**
 This method makes an EarthquakesRequest API call
 */
- (void)retrieveEarthquakes;

@end
