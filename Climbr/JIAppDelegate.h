//
//  AppDelegate.h
//  TheCrag
//
//  Created by Imam, Jauzey on 6/12/13.
//  Copyright (c) 2013 Imam, Jauzey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface JIAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nav;

#define NAVBAR_TINT_COLOR [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1]

@end
