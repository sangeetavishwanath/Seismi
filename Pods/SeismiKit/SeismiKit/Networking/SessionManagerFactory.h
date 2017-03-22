//
//  SessionManagerFactory.h
//  SeismiKit
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

/**
 A factory for session managers
 */
@interface SessionManagerFactory : NSObject

/**
 An HTTP session manager with a JSON request serializer

 @return An HTTP session manager
 */
- (AFHTTPSessionManager *)sessionManager;

@end
