//
//  FirstViewController.m
//  PubNub
//
//  Created by Jordan Zucker on 4/13/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "FirstViewController.h"
#import "JSZSessionManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [[JSZSessionManager sharedInstance] helloWorldGet];
    [[JSZSessionManager sharedInstance] subscribeTest];
    
//    [[JSZSessionManager sharedInstance] historyTest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
