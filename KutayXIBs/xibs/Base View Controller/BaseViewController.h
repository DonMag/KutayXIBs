//
//  BaseViewController.h
//  Octovan
//
//  Created by Sinan Ege on 02/10/2016.
//  Copyright © 2016 Sinan Ege. All rights reserved.
//

@import UIKit;

@interface BaseViewController : UIViewController

@property (nonatomic, strong) MMDrawerController *leftMenu;
@property (nonatomic, strong) NSString *backButtonTitle;

- (void)addLeftMenuIcon;

- (void)setBackButtonTitle:(NSString *)backButtonTitle withAction:(SEL)selector;

- (void)addBarButtonOn:(NavigationButtonSide)side WithTitle:(NSString *)title andSelector:(SEL)buttonSelector;

- (void)addBarButtonOn:(NavigationButtonSide)side WithTitle:(NSString *)title color:(UIColor *)color andSelector:(SEL)buttonSelector;

- (void)dismissTopNavigationController:(UIBarButtonItem *)sender;

- (void)popToRoot;

#pragma mark - Menu Helpers
- (void)closeLeftMenu;

- (void)closeLeftMenuWithCompletion:(void (^)(BOOL completed))completionBlock;

@end

@interface BaseViewController(NavigationHelper)

- (void)pushViewController:(id)vc OnCenterWithCloseMenu:(BOOL)closeMenuEnabled;

- (void)pushViewController:(id)vc closeMenu:(BOOL)closeMenuEnabled;

- (void)showViewController:(id)vc withNavigationController:(BOOL)navigationControllerEnabled closeMenu:(BOOL)closeMenuEnabled;

- (void)setCenterViewController:(id)vc withNavigationController:(BOOL)navigationControllerEnabled closeMenu:(BOOL)closeMenuEnabled;

@end
