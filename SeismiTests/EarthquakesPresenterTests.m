//
//  EarthquakesPresenterTests.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import <SeismiKit/SeismiKit.h>

#import "EarthquakesPresenter.h"
#import "EarthquakeCellPresentationModel.h"

@interface EarthquakesPresenter () <EarthquakesControllerDelegate>

@property (nonatomic, strong) NSArray<EarthquakeCellPresentationModel *> *cellModels;
- (void)earthquakesController:(EarthquakesController *)controller didRetrieveEarthquakes:(NSArray<Earthquake *> *)earthquakes;
- (void)earthquakesController:(EarthquakesController *)controller didFailToRetrieveEarthquakesWithError:(NSError *)error;

@end

SpecBegin(EarthquakesPresenterTests)

describe(@"EarthquakesPresenter", ^{

    __block EarthquakesPresenter *presenter;
    __block id<EarthquakesViewSurface> viewSurface;
    __block EarthquakesController *controller;

    __block EarthquakeCellPresentationModel *earthquake1;
    __block EarthquakeCellPresentationModel *earthquake2;
    __block NSArray<EarthquakeCellPresentationModel *> *earthquakes;

    beforeAll(^{
        controller = mock(EarthquakesController.class);
        presenter = [[EarthquakesPresenter alloc] initWithEarthquakesController:controller];
        viewSurface = mockProtocol(@protocol(EarthquakesViewSurface));
        presenter.viewSurface = viewSurface;

        earthquake1 = mock(EarthquakeCellPresentationModel.class);
        earthquake2 = mock(EarthquakeCellPresentationModel.class);
        earthquakes = [NSArray arrayWithObjects:earthquake1, earthquake2, nil];
        presenter.cellModels = earthquakes;
    });

    describe(@"earthquakesViewDidLoad", ^{

        it(@"will ask the viewsurface to show the loading indicator and the controller to load earthquakes", ^{
            [presenter earthquakesViewDidLoad];
            [verifyCount(viewSurface, times(1)) displayLoadingIndicator];
            [verifyCount(controller, times(1)) retrieveEarthquakes];
        });
    });

    describe(@"numberOfSectionsInEarthquakeTable", ^{

        it(@"will return 1", ^{
            expect([presenter numberOfSectionsInEarthquakeTable]).to.equal(1);
        });
    });

    describe(@"numberOfRowsInSection:", ^{

        it(@"will return the correct number of rows", ^{
            expect([presenter numberOfRowsInSection:0]).to.equal(2);
        });
    });

    describe(@"cellModelForRowAtIndexPath:", ^{

        it(@"will return the correct cell model", ^{
            expect([presenter cellModelForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]).to.equal(earthquake1);
            expect([presenter cellModelForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]]).to.equal(earthquake2);
        });
    });

    describe(@"earthquakesController:didRetrieveEarthquakes:", ^{

        it(@"will notify the view surface to hide the loading state and that earthquakes have been loaded", ^{

            [presenter earthquakesController:controller didRetrieveEarthquakes:nil];
            [verifyCount(viewSurface, times(1)) hideLoadingIndicator];
            [verifyCount(viewSurface, times(1)) earthquakesDataLoaded];
        });
    });

    describe(@"earthquakesController:didFailToRetrieveEarthquakesWithError:", ^{

        it(@"will notify the view surface to hide the loading state and that there was an error loading earthquakes", ^{

            [presenter earthquakesController:controller didFailToRetrieveEarthquakesWithError:nil];
            [verifyCount(viewSurface, times(1)) hideLoadingIndicator];
            [verifyCount(viewSurface, times(1)) displayErrorMessage:@"There was an error loading earthquakes. Please try again."];
        });
    });
});

SpecEnd
