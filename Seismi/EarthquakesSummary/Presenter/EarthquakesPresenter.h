//
//  EarthquakesPresenter.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EarthquakeCellPresentationModel;

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

/**
 Directs the view surface to display an error
 @param message The error message
 */
- (void)displayErrorMessage:(NSString *)message;

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

/**
 This method returns the number of sections in the table
 */
- (NSInteger)numberOfSectionsInEarthquakeTable;

/**
 This method returns the number of rows in the given section
 */
- (NSInteger)numberOfRowsInSection:(NSUInteger)sectionIndex;

/**
 This method returns the presentation model for the cell at given index path
 */
- (EarthquakeCellPresentationModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
