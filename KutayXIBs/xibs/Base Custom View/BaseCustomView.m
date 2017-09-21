//
//  BaseCustomView.m
//  Octovan
//
//  Created by Sinan Ege on 15/11/2016.
//  Copyright © 2016 Sinan Ege. All rights reserved.
//

#import "BaseCustomView.h"

@implementation BaseCustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self load];
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self load];
        [self commonInit];
    }
    return self;
}

- (void)load {
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
}

- (void)commonInit {
    
}

@end
