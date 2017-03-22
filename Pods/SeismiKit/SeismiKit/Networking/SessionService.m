//
//  SessionService.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "SessionService.h"

#import "SessionManagerFactory.h"

@implementation SessionService

+ (SessionService *)sharedInstance
{
    static dispatch_once_t p = 0;

    __strong static id _sharedObject = nil;

    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });

    return _sharedObject;
}

- (instancetype)init
{
    self = [super init];

    if (self) {
        SessionManagerFactory *sessionManagerFactory = [[SessionManagerFactory alloc] init];
        _sessionManager = [sessionManagerFactory sessionManager];

    }
    
    return self;
}

@end
