//
//  anotherVCClassViewController.m
//  reneistheman
//
//  Created by Merritt Tidwell on 9/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "anotherVCClassViewController.h"

@interface anotherVCClassViewController ()

@end

@implementation anotherVCClassViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.aTextBox.text = self.thatStringfromTheOtherView;
    
    NSLog(@"%@",self.thatStringfromTheOtherView);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.aTextBox.text = self.thatStringfromTheOtherView;
    
    NSLog(@"%@",self.thatStringfromTheOtherView);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setLabelForTheString:(UILabel *)labelForTheString{
    _labelForTheString = labelForTheString;
    
    
    self.labelForTheString.text = self.thatStringfromTheOtherView;
    
}


-(void)setThatStringfromTheOtherView:(NSString *)thatStringfromTheOtherView{
    
    
    _thatStringfromTheOtherView =thatStringfromTheOtherView;
    
    
    
    self.aTextBox.text = self.thatStringfromTheOtherView;
    
    NSLog(@"%@",self.thatStringfromTheOtherView);
    
    
    
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
