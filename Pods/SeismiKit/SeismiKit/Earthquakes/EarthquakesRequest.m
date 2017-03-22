//
//  EarthquakesRequest.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesRequest.h"

static NSString *const kRequestPath = @"http://www.seismi.org/api/eqs/";

@implementation EarthquakesRequest

- (instancetype)init
{
    self = [super init];

    if (self) {
        _url = [[NSURL alloc] initWithString:kRequestPath];
        _parameters = @{};
    }

    return self;
}

@end
