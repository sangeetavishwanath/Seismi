//
//  EarthquakesPresenter.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This protocol defines actions to be performed by the Earthquakes view
 */
@protocol EarthquakesViewSurface <NSObject>

/**
 Directs the earthquakes view to display a loading spinner
 */
- (void)displayLoadingIndicator;

/**
 Directs the earthquakes view to hide a loading spinner
 */
- (void)hideLoadingIndicator;

/**
 Notifies the view surface that the earthquake data has been loaded
 */
- (void)earthquakesDataLoaded;

@end

/**
 This class encapsulates the presentation logic for the earthquakes view
 */
@interface EarthquakesPresenter : NSObject

/**
 The earthquakes view surface
 */
@property (nonatomic, weak) id<EarthquakesViewSurface> viewSurface;

/**
 This method handles the event where the earthquakes view did load
 */
- (void)earthquakesViewDidLoad;

@end
