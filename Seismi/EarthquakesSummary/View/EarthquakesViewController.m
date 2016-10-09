//
//  EarthquakesViewController.m
//  Seismi
//
//  Created by Sangeeta Vishwanath on 8/10/2016.
//  Copyright © 2016 Sangeeta Vishwanath. All rights reserved.
//

#import "EarthquakesViewController.h"

#import "EarthquakeCellPresentationModel.h"
#import "EarthquakeTableViewCell.h"
#import "EarthquakesPresenter.h"

static NSString *const kAlertTitle = @"Error";
static NSString *const kAlertAction = @"Retry";

@interface EarthquakesViewController () <EarthquakesViewSurface, UITableViewDataSource>

@property (nonatomic, strong) EarthquakesPresenter *presenter;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *earthquakesTableView;

@end

@implementation EarthquakesViewController

#pragma mark - view lifecycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.earthquakesTableView.dataSource= self;

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

- (void)displayErrorMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:kAlertTitle
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    __weak __typeof__(self) weakSelf = self;
    [alert addAction:[UIAlertAction actionWithTitle:kAlertAction
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                __strong __typeof__(weakSelf) strongSelf = weakSelf;
                                                [strongSelf.presenter earthquakesViewDidLoad];
                                            }]];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.presenter numberOfSectionsInEarthquakeTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.presenter numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EarthquakeCellPresentationModel *model = [self.presenter cellModelForRowAtIndexPath:indexPath];

    EarthquakeTableViewCell *cell = [self.earthquakesTableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
    [cell configureWithModel:model];

    return cell; 
}

@end
