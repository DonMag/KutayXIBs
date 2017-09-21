//
//  ViewController.m
//  KutayXIBs
//
//  Created by Don Mag on 9/21/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

#import "MyTripDetailViewController.h"
#import "StaticDetailVerticalView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet StaticDetailVerticalView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)pushDetailTapped:(id)sender {
	
	MyTripDetailViewController *vc = [MyTripDetailViewController new];
	
	[self.navigationController pushViewController:vc animated:YES];
	
}

- (IBAction)changeFontsTapped:(id)sender {
	
	[_testView setUpperLabelFontSize:30.0];
	[_testView setLowerLabelFontSize:10.0];
	
	
}

@end
