//
//  EarthquakeTableViewCell.h
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EarthquakeCellPresentationModel;

@interface EarthquakeTableViewCell : UITableViewCell

- (void)configureWithModel:(EarthquakeCellPresentationModel *)model;

@end
