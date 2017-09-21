//
//  BaseViewController.m
//  Octovan
//
//  Created by Sinan Ege on 02/10/2016.
//  Copyright © 2016 Sinan Ege. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

#pragma mark - Menu Helpers
-(MMDrawerController *)leftMenu {
    UIViewController *parentViewController = self.parentViewController;
    while (parentViewController != nil) {
        if([parentViewController isKindOfClass:[MMDrawerController class]]){
            return (MMDrawerController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}

-(void)closeLeftMenu {
    [self.leftMenu closeDrawerAnimated:YES completion:^(BOOL finished) {
        DDLogDebug(@"Left Menu Closed");
    }];
}

-(void)closeLeftMenuWithCompletion:(void (^)(BOOL completed))completionBlock {
    [self.leftMenu closeDrawerAnimated:YES completion:^(BOOL finished) {
        completionBlock(YES);
    }];
}

#pragma mark - Navigation Bar Helpers
- (void)addLeftMenuIcon {
    UIButton *buttonLeftMenu =[[UIButton alloc] init];
    [buttonLeftMenu setBackgroundImage:[UIImage imageNamed:@"menu_icon"] forState:UIControlStateNormal];
    
    buttonLeftMenu.frame = CGRectMake(0, 0, 20, 20);
    UIBarButtonItem *barButtonLeftMenu =[[UIBarButtonItem alloc] initWithCustomView:buttonLeftMenu];
    [buttonLeftMenu addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barButtonLeftMenu;
}

- (void)toggleMenu {
    [self.leftMenu toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle {
    [self setBackButtonTitle:backButtonTitle withAction:@selector(back:)];
}

- (void)setBackButtonTitle:(NSString *)backButtonTitle withAction:(SEL)selector {
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle style:UIBarButtonItemStylePlain target:self action:selector];
    backBarButton.tintColor = [UIColor appWhiteColor];
    self.navigationItem.leftBarButtonItem = backBarButton;
}

- (void)addBarButtonOn:(NavigationButtonSide)side WithTitle:(NSString *)title andSelector:(SEL)buttonSelector {
    [self addBarButtonOn:side WithTitle:title color:[UIColor whiteColor] andSelector:buttonSelector];
}

- (void)addBarButtonOn:(NavigationButtonSide)side WithTitle:(NSString *)title color:(UIColor *)color andSelector:(SEL)buttonSelector {
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:buttonSelector];
    barButton.tintColor = color;
    if (side == NavigationButtonSideLeft) {
        self.navigationItem.leftBarButtonItem = barButton;
    }
    else{
        self.navigationItem.rightBarButtonItem = barButton;
    }
}

- (void) back:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)dismissTopNavigationController:(UIBarButtonItem *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end

@implementation BaseViewController(SegueHelper)

#pragma mark - Show/Push Merhods
- (void)pushViewController:(id)vc OnCenterWithCloseMenu:(BOOL)closeMenuEnabled{
    if ( [self isVCValid:vc] == NO ) {
        return;
    }
    else if ([self.leftMenu.centerViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)self.leftMenu.centerViewController;
        [self.leftMenu closeDrawerAnimated:closeMenuEnabled completion:^(BOOL finished) {
            [nav pushViewController:vc animated:NO];
        }];
    }
}

- (void)pushViewController:(id)vc closeMenu:(BOOL)closeMenuEnabled{
    if ( ([self isVCValid:vc] == YES) && (self.navigationController != nil)) {
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        DDLogError(@"Push VC Error");
    }
}

- (void)showViewController:(id)vc withNavigationController:(BOOL)navigationControllerEnabled closeMenu:(BOOL)closeMenuEnabled{
    if ( [self isVCValid:vc] == NO ) {
        return;
    }
    else if (navigationControllerEnabled == YES) {
        UINavigationController *modalNav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self closeLeftMenu];
        __block BaseViewController *weakSelf = self;
        [self closeLeftMenuWithCompletion:^(BOOL completed) {
            [weakSelf presentViewController:modalNav animated:YES completion:^{
                DDLogDebug(@"Navigation Controller showed with root: %@VC",NSStringFromClass([vc class]));
            }];
        }];
        
        
    }
    else{
        [self presentViewController:vc animated:YES completion:^{
            DDLogDebug(@"%@VC Presented",NSStringFromClass([vc class]));
        }];
    }
}

- (void)setCenterViewController:(id)vc withNavigationController:(BOOL)navigationControllerEnabled closeMenu:(BOOL)closeMenuEnabled{
    if ( [self isVCValid:vc] == NO ) {
        return;
    }
    else{
        if(navigationControllerEnabled == YES){
            UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:vc];
            
            [self.leftMenu setCenterViewController:centerNav withCloseAnimation:closeMenuEnabled completion:^(BOOL finished) {
                DDLogDebug(@"%@ setted to center with Navigation Controller",NSStringFromClass([vc class]));
            }];
        }
        else{
            [self.leftMenu setCenterViewController:vc withCloseAnimation:closeMenuEnabled completion:^(BOOL finished) {
                DDLogDebug(@"%@ setted to center",NSStringFromClass([vc class]));
            }];
        }
    }
}

#pragma mark - Segue Helper
- (void)showLoginViewControllerWithCompletionHandler:(void(^)(BOOL loginCompleted))completionHandler {
    [self showViewController:[VCManager defaultVCWithType:VCTypeLogin] withNavigationController:YES closeMenu:YES];
}

#pragma mark - VC Validator
- (BOOL)isVCValid:(id)vc{
    if ( ![vc isKindOfClass:[UIViewController class]] ) {
        return NO;
    }
    else{
        return YES;
    }
}

@end
