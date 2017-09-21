//
//  MyTripDetailView.h
//  KutayXIBs
//
//  Created by Don Mag on 9/21/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseCustomView.h"

#import "StaticDetailVerticalView.h"

@interface MyTripDetailView : BaseCustomView

@property (weak, nonatomic) IBOutlet StaticDetailVerticalView *estimatedFeeView;
@property (weak, nonatomic) IBOutlet StaticDetailVerticalView *promotionCodeView;

@end
