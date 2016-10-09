//
//  EarthquakeCellPresentationModel.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Earthquake;

/**
 This presentation model encapsulates the information required to configure an earthquake cell
 */
@interface EarthquakeCellPresentationModel : NSObject

/**
 The cell identifier
 */
@property (nonatomic, readonly, copy) NSString *cellIdentifier;

/**
 The title text
 */
@property (nonatomic, readonly, copy) NSString *titleText;

/**
 The subtitle text
 */
@property (nonatomic, readonly, copy) NSString *subtitleText;

/**
 The accessory text
 */
@property (nonatomic, readonly, copy) NSString *accessoryText;

/**
 The cell color
 */
@property (nonatomic, readonly) UIColor *cellColor;

/**
 Instantiates an instance of the earthquake presentation model from the earthquake

 @param earthquake The earthquake object
 @return An instance of EarthquakeCellPresentationModel
 */
- (instancetype)initWithEarthquake:(Earthquake *)earthquake;

@end
