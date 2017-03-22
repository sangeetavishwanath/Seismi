//
//  EarthquakesController.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesController.h"

#import "EarthquakesList.h"
#import "EarthquakesService.h"

@interface EarthquakesController () <EarthquakesServiceDelegate>

@property (nonatomic, strong) EarthquakesService *service;

@end

@implementation EarthquakesController

- (instancetype)initWithService:(EarthquakesService *)service
{
    self = [super init];

    if (self) {
        _service = service;
        _service.delegate = self;
    }

    return self;
}

- (instancetype)init
{
    EarthquakesService *service = [[EarthquakesService alloc] init];
    return [self initWithService:service];
}

- (void)retrieveEarthquakes
{
    [self.service retrieveEarthquakes];
}

#pragma mark - EarthquakesServiceDelegate

- (void)earthquakesService:(EarthquakesService *)service didRetrieveEarthquakes:(EarthquakesList *)earthquakeList
{
    /**
     *  At the moment, we just pass the earthquakes list straight to the delegate.
     *
     *  However, in the future, this class can be used to perform any additional tasks like:
     *  - Caching the earthquake list until forcefully refreshed
     *  - Merging data about the earthquake from some other API call, etc.
     */
    
    [self.delegate earthquakesController:self didRetrieveEarthquakes:earthquakeList.earthquakes];
}

- (void)earthquakesService:(EarthquakesService *)service didFailToRetrieveEarthquakesWithError:(NSError *)error
{
    [self.delegate earthquakesController:self didFailToRetrieveEarthquakesWithError:error];
}

@end
