//
//  tabbar.m
//  My List
//
//  Created by Merritt Tidwell on 9/5/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "tabbar.h"
#import "view1.h"
#import "View2.h"



@interface tabbar ()
@implementation tabbar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    UIViewController * view1 = [[UIViewController alloc]init];
   
    UIViewController * view2 = [[UIViewController alloc]init];
    
    NSMutableArray * tabbarControllers = [[NSMutableArray alloc]init];
        [tabbarControllers addObject:view1];
        [tabbarControllers addObject:view2];
    
    [self setViewControllers:tabbarControllers];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
