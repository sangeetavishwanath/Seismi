//
//  SessionService.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

/**
 This class encapsulates session related information
 */
@interface SessionService : NSObject

/**
 The SessionService singleton

 @return The SessionService singleton
 */
+ (SessionService *)sharedInstance;

/**
 The session manager to make API calls
 */
@property (nonatomic, readonly) AFHTTPSessionManager *sessionManager;

@end
