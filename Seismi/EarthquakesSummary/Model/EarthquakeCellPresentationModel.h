//
//  EarthquakeCellPresentationModel.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EarthquakeCellPresentationModel : NSObject

@property (nonatomic, readonly, copy) NSString *titleText;
@property (nonatomic, readonly, copy) NSString *subtitleText;
@property (nonatomic, readonly, copy) NSString *accessoryText;
@property (nonatomic, readonly) UIColor *cellColor;

@end
