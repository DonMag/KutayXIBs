//
//  TripDetailView.m
//  Kargo
//
//  Created by Kutay Demireren on 11/09/17.
//  Copyright © 2017 Sinan Ege. All rights reserved.
//

#import "TripDetailView.h"
#import "UpdatableDetailHorizontalView.h"
#import "StaticDetailVerticalView.h"
#import "UpdatableDetailVerticalView.h"

@interface TripDetailView() <UpdatableDetailHorizontalViewDelegate>

@property (weak, nonatomic) IBOutlet UpdatableDetailHorizontalView *dateView;
@property (weak, nonatomic) IBOutlet UpdatableDetailHorizontalView *paymentMethodView;
@property (weak, nonatomic) IBOutlet UpdatableDetailHorizontalView *goodsDetailView;

@property (weak, nonatomic) IBOutlet StaticDetailVerticalView *estimatedFeeView;
@property (weak, nonatomic) IBOutlet StaticDetailVerticalView *promotionCodeView;

@property (weak, nonatomic) IBOutlet UpdatableDetailVerticalView *helperCountView;
@property (weak, nonatomic) IBOutlet UpdatableDetailVerticalView *insuranceView;
@end

@implementation TripDetailView

NSString *dateViewIdentifier = @"DV";
NSString *paymentMethodViewIdentifier = @"PMV";
NSString *goodsDetailViewIdentifier = @"GDV";

- (void)commonInit {
    [super commonInit];
    
    [self configureDelegates];
    [self configureHorizontalViews];
    
}

#pragma mark - Initializers & Configurations
- (void)configureWithCompletedTrip:(TripHistoryModel *)trips {
    
}

- (void)configureWithFutureTrip:(FutureDemandPartialModel *)trips {
    
}

- (void)configureDelegates {
    self.dateView.delegate = self;
    self.paymentMethodView.delegate = self;
    self.goodsDetailView.delegate = self;
}

- (void)configureHorizontalViews {
    self.dateView.customIdentifier = dateViewIdentifier;
    self.paymentMethodView.customIdentifier = paymentMethodViewIdentifier;
    self.goodsDetailView.customIdentifier = goodsDetailViewIdentifier;

    [self.paymentMethodView setInformationText:@"1234 56** **** ****"]; // => this is the way iyzico shares credit card info
    [self.goodsDetailView setInformationText:@"1 adet dolap, 2 adet kutulanmis maket, 3 tane cansiz manken"];
}

#pragma mark - UpdatableDetailHorizontalViewDelegate
- (void)actionButtonTapped:(UpdatableDetailHorizontalView *)updatableDetailHorizontalView {
    // TODO - take the necessary action here for horizontal views' action button
    if(updatableDetailHorizontalView.customIdentifier == dateViewIdentifier) {
        
    } else if (updatableDetailHorizontalView.customIdentifier == paymentMethodViewIdentifier) {
        
    } else if (updatableDetailHorizontalView.customIdentifier == goodsDetailViewIdentifier) {
        
    } else {
        
    }
}

@end
