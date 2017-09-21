//
//  MyTripDetailViewController.m
//  KutayXIBs
//
//  Created by Don Mag on 9/21/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "MyTripDetailViewController.h"
#import "MyTripDetailView.h"

@interface MyTripDetailViewController ()

@property (weak, nonatomic) IBOutlet MyTripDetailView *tripDetailView;

@end

@implementation MyTripDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[_tripDetailView.estimatedFeeView setUpperLabelText:@"via Code (24)"];
	[_tripDetailView.estimatedFeeView setUpperLabelFontSize:24.0];

	[_tripDetailView.estimatedFeeView setLowerLabelText:@"via Code (15)"];
	[_tripDetailView.estimatedFeeView setLowerLabelFontSize:15.0];

}


@end
