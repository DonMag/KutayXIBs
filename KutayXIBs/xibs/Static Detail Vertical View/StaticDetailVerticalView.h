//
//  StaticDetailVerticalView.h
//  Kargo
//
//  Created by Kutay Demireren on 21/09/17.
//  Copyright © 2017 Sinan Ege. All rights reserved.
//

#import "BaseCustomView.h"

@protocol StaticDetailVerticalView;

IB_DESIGNABLE

@interface StaticDetailVerticalView : BaseCustomView

@property (nonatomic) IBInspectable CGFloat upperLabelFontSize;
@property (nonatomic) IBInspectable CGFloat lowerLabelFontSize;

@property (nonatomic) IBInspectable NSString *upperLabelText;
@property (nonatomic) IBInspectable NSString *lowerLabelText;

- (void)configureFonts;

@end
