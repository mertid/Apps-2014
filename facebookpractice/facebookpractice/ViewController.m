//
//  ViewController.m
//  facebookpractice
//
//  Created by Merritt Tidwell on 9/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>



@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
  
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
