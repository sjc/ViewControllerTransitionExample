//
//  NavigationViewController.m
//  TransitionTest
//
//  Created by Stuart Crook on 25/11/2014.
//  Copyright (c) 2014 JAM. All rights reserved.
//

#import "NavigationViewController.h"
#import "SJCOverlayViewController.h" // to get SJCAnimatedTransitioning

// sorry, messy. i need to make this public in the overlay view controller library
@interface SJCOverlayViewControllerTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>
@end

@interface NavigationViewController ()

@property (nonatomic,strong) SJCOverlayViewControllerTransitioningDelegate *td;

@end

@implementation NavigationViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if((self = [super initWithRootViewController:rootViewController])) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = _td = [SJCOverlayViewControllerTransitioningDelegate new];
    }
    return self;
}

- (Class)animatedTransitioningClass {
    return [SJCAnimatedTransitioning class];
}

@end
