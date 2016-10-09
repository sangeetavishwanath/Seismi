//
//  EarthquakesViewController.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesViewController.h"

#import "EarthquakesPresenter.h"

@interface EarthquakesViewController () <EarthquakesViewSurface>

@property (nonatomic, strong) EarthquakesPresenter *presenter;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *earthquakesTableView;

@end

@implementation EarthquakesViewController

#pragma mark - view lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.presenter = [[EarthquakesPresenter alloc] init];
    self.presenter.viewSurface = self;

    [self.presenter earthquakesViewDidLoad];
}

#pragma mark - EarthquakesViewSurface methods

- (void)displayLoadingIndicator
{
    [self.activityIndicator startAnimating];
}

- (void)hideLoadingIndicator
{
    [self.activityIndicator stopAnimating];
}

- (void)earthquakesDataLoaded
{
    [self.earthquakesTableView reloadData];
}

@end
