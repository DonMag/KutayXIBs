//
//  StaticDetailVerticalView.m
//  Kargo
//
//  Created by Kutay Demireren on 21/09/17.
//  Copyright © 2017 Sinan Ege. All rights reserved.
//

#import "StaticDetailVerticalView.h"

@interface StaticDetailVerticalView()

@property (weak, nonatomic) IBOutlet UILabel *upperLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@end

@implementation StaticDetailVerticalView

#pragma mark - Initializers
- (void)commonInit {
    [super commonInit];
    [self configureView];
}

#pragma mark - Configurations
- (void)configureView {
    [self configureFonts];
}

- (void)configureFonts {
    /*
     [self.textField setFont:[UIFont fontWithName:@"Korolev-Light" size:30.0]];
     self.textField.attributedPlaceholder = [[NSAttributedString alloc]
     initWithString:@"KODU GİRİN"
     attributes:@{
     NSFontAttributeName : [UIFont fontWithName:@"Korolev-Light" size:30.0]
     }];
     [self.headlineLabel setFont:[UIFont fontWithName:@"Korolev-Medium" size:17]];
     [self.sublineLabel setFont:[UIFont fontWithName:@"Korolev-Light" size:16]];
     [self.warningLabel setFont:[UIFont fontWithName:@"Korolev-Light" size:13]];
     */
}

# pragma mark - Setters of IBInspectables
- (void)setLowerLabelFontSize:(CGFloat)lowerLabelFontSize {
    self.lowerLabel.font = [UIFont systemFontOfSize:lowerLabelFontSize];
}

- (void)setUpperLabelFontSize:(CGFloat)upperLabelFontSize {
    self.upperLabel.font = [UIFont systemFontOfSize:upperLabelFontSize];
}

- (void)setLowerLabelText:(NSString *)lowerLabelText {
    self.lowerLabel.text = lowerLabelText;
}

- (void)setUpperLabelText:(NSString *)upperLabelText {
    self.upperLabel.text = upperLabelText;
}

@end
