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

#import "EarthquakesPresenter.h"

SpecBegin(EarthquakesPresenterTests)

describe(@"EarthquakesPresenter", ^{

    __block EarthquakesPresenter *presenter;
    __block id<EarthquakesViewSurface> viewSurface;

    beforeAll(^{
        presenter = [[EarthquakesPresenter alloc] init];
        viewSurface = mockProtocol(@protocol(EarthquakesViewSurface));
        presenter.viewSurface = viewSurface;
    });

    describe(@"earthquakesViewDidLoad", ^{

        it(@"will ask the viewsurface to show the loading indicator", ^{
            [presenter earthquakesViewDidLoad];
            [verifyCount(viewSurface, times(1)) displayLoadingIndicator];
        });
    });
});

SpecEnd
