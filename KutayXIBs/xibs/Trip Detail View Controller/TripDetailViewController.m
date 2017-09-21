//
//  TripDetailViewController.m
//  Kargo
//
//  Created by Kutay Demireren on 11/09/17.
//  Copyright © 2017 Sinan Ege. All rights reserved.
//

#import "TripDetailViewController.h"
#import "TripDetailView.h"

@interface TripDetailViewController()
@property (weak, nonatomic) IBOutlet TripDetailView *tripDetailView;
@end

@implementation TripDetailViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.backButtonTitle = @"< Geri";    
}


@end
