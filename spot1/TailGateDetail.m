//
//  TailGateDetail.m
//  spot1
//
//  Created by Merritt Tidwell on 10/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "TailGateDetail.h"

@interface TailGateDetail ()

@end

@implementation TailGateDetail{

    UILabel * tailGateNameLabel;
    PFObject * tailgate;
    

}

-(void)setVenueInfo:(PFObject *)venueInfo {
    
   // tailgate = self.venueInfo[@"objectId"];
    tailGateNameLabel.text = self.venueInfo[@"TailgateName"];
    
    NSLog(@"%@",tailGateNameLabel);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
  // tailgate label
    
    tailGateNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 100, 200, 40)];
  
    // tailGateNameLabel.text = @"tailgatename";
    tailGateNameLabel.textColor = [UIColor redColor];
    
    [self.view addSubview:tailGateNameLabel];
    
    
 
  // parse
    
    
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
