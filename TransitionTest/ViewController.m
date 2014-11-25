//
//  ViewController.m
//  TransitionTest
//
//  Created by Stuart Crook on 25/11/2014.
//  Copyright (c) 2014 JAM. All rights reserved.
//

#import "ViewController.h"
#import "NavigationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTapped:)];
}

- (IBAction)doneTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// present a standard UINavigationController
- (IBAction)normalTapped:(id)sender {
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    [self presentViewController:nc animated:YES completion:nil];
}

// present a UINavigationController subclass which implements a custom transition
- (IBAction)customTapped:(id)sender {
    NavigationViewController *nvc = [[NavigationViewController alloc] initWithRootViewController:[ViewController new]];
    [self presentViewController:nvc animated:YES completion:nil];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // notice that this gets called when the 'normal' navigation controller is presented, but not when the one
    // using the custom transition is
    NSLog(@"bye!");
}

@end
