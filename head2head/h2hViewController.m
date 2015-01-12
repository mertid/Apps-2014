//
//  h2hViewController.m
//  head2head
//
//  Created by Merritt Tidwell on 10/30/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "h2hViewController.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface h2hViewController ()

@end

@implementation h2hViewController
{
    UIImageView * featuredlogo1;
    UIImageView * featuredlogo2;


}
- (void)viewDidLoad {
    
   
    
    UIImage * image  = [UIImage imageNamed:@"uga.png"];
    
    featuredlogo1 = [[UIImageView alloc]initWithImage:image];
    featuredlogo1.frame = CGRectMake(SCREEN_WIDTH/12, SCREEN_HEIGHT/10, 80, 80);
    [self.view addSubview:featuredlogo1];
  
    
    featuredlogo2 = [[UIImageView alloc]initWithImage:image];
    featuredlogo2.frame = CGRectMake(SCREEN_WIDTH-100, SCREEN_HEIGHT/10, 80, 80);
    [self.view addSubview:featuredlogo2];
  
    
    UILabel * vsLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.2, SCREEN_HEIGHT/8, 50, 50)];
    vsLabel.text = @"vs";
    vsLabel.font = [UIFont fontWithName:@"Helvetica" size:35];
    [self.view addSubview:vsLabel];
    
    UILabel * featuredLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/16, 200, 40)];
    featuredLabel.text = @"Featured MatchUp";
    featuredLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [self.view addSubview:featuredLabel];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
