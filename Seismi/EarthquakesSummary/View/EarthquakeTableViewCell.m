//
//  EarthquakeTableViewCell.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 9/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakeTableViewCell.h"
#import "EarthquakeCellPresentationModel.h"

@interface EarthquakeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessoryLabel;

@end

@implementation EarthquakeTableViewCell

- (void)configureWithModel:(EarthquakeCellPresentationModel *)model
{
    self.titleLabel.text = model.titleText;
    self.subtitleLabel.text = model.subtitleText;
    self.accessoryLabel.text = model.accessoryText;
    self.backgroundColor = model.cellColor;

    self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}

@end
