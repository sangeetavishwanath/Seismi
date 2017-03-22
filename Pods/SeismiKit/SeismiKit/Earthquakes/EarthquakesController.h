//
//  EarthquakesController.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Earthquake;
@class EarthquakesController;
@class EarthquakesService;

/**
 This protocol defines methods to notify delegates of the earthquake retrieval status
 */
@protocol EarthquakesControllerDelegate <NSObject>

/**
 Use this method to notify delegates of the successful retrieval of earthquakes

 @param controller  The EarthquakesController notifying the delegate
 @param earthquakes The list of earthquakes retrieved
 */
- (void)earthquakesController:(EarthquakesController *)controller didRetrieveEarthquakes:(NSArray<Earthquake *> *)earthquakes;

/**
 Use this method to notify delegates of a failure in retrieving earthquakes

 @param controller The EarthquakesController notifying the delegate
 @param error      The error encountered
 */
- (void)earthquakesController:(EarthquakesController *)controller didFailToRetrieveEarthquakesWithError:(NSError *)error;

@end

/**
 The EarthquakesController is used to retrieve earthquakes information
 */
@interface EarthquakesController : NSObject

/**
 The delegate to send earthquake retrieval information to
 */
@property (nonatomic, weak) id<EarthquakesControllerDelegate> delegate;

/**
 Initialises an instance of EarthquakesController with the EarthquakesService instance

 @param service The EarthquakesService

 @return An instance of EarthquakesController
 */
- (instancetype)initWithService:(EarthquakesService *)service NS_DESIGNATED_INITIALIZER;

/**
 A convenience initialiser for EarthquakesController

 @return An instance of EarthquakesController
 */
- (instancetype)init;

/**
 Retrieves a list of recent earthquakes
 */
- (void)retrieveEarthquakes;

@end
