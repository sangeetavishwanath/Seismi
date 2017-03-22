//
//  SessionManagerFactory.m
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "SessionManagerFactory.h"

#import <AFNetworking/AFNetworking.h>

static const NSTimeInterval defaultTimeoutInterval = 30;

@implementation SessionManagerFactory

- (AFHTTPSessionManager *)sessionManager
{
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];

    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];

    sessionManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    sessionManager.requestSerializer.timeoutInterval = defaultTimeoutInterval;

    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    sessionManager.responseSerializer = [[AFJSONResponseSerializer alloc] init];

    sessionManager.securityPolicy.allowInvalidCertificates = YES;

    return sessionManager;
}

@end
