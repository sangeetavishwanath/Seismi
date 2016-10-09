//
//  EarthquakesPresenter.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesPresenter.h"

#import "EarthquakeCellPresentationModel.h"

#import <SeismiKit/SeismiKit.h>

static NSString *const kAlertError = @"There was an error loading earthquakes. Please try again.";

@interface EarthquakesPresenter () <EarthquakesControllerDelegate>

@property (nonatomic, strong) EarthquakesController *earthquakesController;
@property (nonatomic, strong) NSArray<EarthquakeCellPresentationModel *> *cellModels;
@end

@implementation EarthquakesPresenter

- (void)earthquakesViewDidLoad
{
    [self.viewSurface displayLoadingIndicator];

    self.earthquakesController = [[EarthquakesController alloc] init];
    self.earthquakesController.delegate = self;

    [self loadEarthquakes];
}

- (NSInteger)numberOfSectionsInEarthquakeTable
{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSUInteger)sectionIndex
{
    return [self.cellModels count];
}

- (EarthquakeCellPresentationModel *)cellModelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellModels objectAtIndex:indexPath.row];
}

#pragma mark - Helpers

- (void)loadEarthquakes
{
    [self.earthquakesController retrieveEarthquakes];
}

#pragma mark - EarthquakesControllerDelegate methods

- (void)earthquakesController:(EarthquakesController *)controller didRetrieveEarthquakes:(NSArray<Earthquake *> *)earthquakes
{
    NSMutableArray<EarthquakeCellPresentationModel *> *models = [NSMutableArray array];

    for (Earthquake *earthquake in earthquakes) {
        EarthquakeCellPresentationModel *model = [[EarthquakeCellPresentationModel alloc] initWithEarthquake:earthquake];
        [models addObject:model];
    }

    self.cellModels = models;

    [self.viewSurface hideLoadingIndicator];
    [self.viewSurface earthquakesDataLoaded];
}

- (void)earthquakesController:(EarthquakesController *)controller didFailToRetrieveEarthquakesWithError:(NSError *)error
{
    [self.viewSurface displayErrorMessage:kAlertError];
}

@end
