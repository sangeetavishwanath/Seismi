//
//  EarthquakesPresenter.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesPresenter.h"

#import <SeismiKit/SeismiKit.h>

@interface EarthquakesPresenter () <EarthquakesControllerDelegate>

@property (nonatomic, strong) EarthquakesController *earthquakesController;

@end

@implementation EarthquakesPresenter

- (void)earthquakesViewDidLoad
{
    [self.viewSurface displayLoadingIndicator];

    self.earthquakesController = [[EarthquakesController alloc] init];
    self.earthquakesController.delegate = self;

    [self loadEarthquakes];
}

#pragma mark - Helpers

- (void)loadEarthquakes
{
    [self.earthquakesController retrieveEarthquakes];
}

#pragma mark - EarthquakesControllerDelegate methods

- (void)earthquakesController:(EarthquakesController *)controller didRetrieveEarthquakes:(NSArray<Earthquake *> *)earthquakes
{
    [self.viewSurface hideLoadingIndicator];
    [self.viewSurface earthquakesDataLoaded];
}

- (void)earthquakesController:(EarthquakesController *)controller didFailToRetrieveEarthquakesWithError:(NSError *)error
{
    
}

@end
