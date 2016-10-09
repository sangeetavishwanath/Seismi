//
//  EarthquakeTableViewCell.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EarthquakeCellPresentationModel;

/**
 This cell represents an earthquake in the earthquake view
 */
@interface EarthquakeTableViewCell : UITableViewCell

/**
 *  Configure the cell with the given presentation model
 *
 *  @param model The presentation model
 */
- (void)configureWithModel:(EarthquakeCellPresentationModel *)model;

@end
