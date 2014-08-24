//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by Merritt Tidwell on 7/30/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "STAEditItemViewController.h"



@interface STAEditItemViewController () <UITextFieldDelegate>


@end

@implementation STAEditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        self.view.backgroundColor = [UIColor whiteColor];

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    

    
    // Do any additional setup after loading the view.
}

-(void)setItemInfo:(NSMutableDictionary *)itemInfo
{
    _itemInfo = itemInfo;
    
    UITextField * itemNameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 45, SCREEN_WIDTH - 40,40)];
    itemNameField.text = itemInfo[@"name"];
    // another part of using the return button on keyboard//
    itemNameField.delegate = self;
    itemNameField.textColor = [UIColor whiteColor];

    float priority = [itemInfo[@"priority"]floatValue];
    float priorityHue = priority/360 ;
    
    
 //   self.itemInfo[@"priority"]= @(priority);
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    [self.view addSubview:itemNameField];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// method for hitting return on text

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    self.itemInfo[@"name"] = textField.text;
    [textField resignFirstResponder];
    return YES;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:location];
 
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:location];
    
}

-(void)changeColorWithLocation:(CGPoint)location

{
    float priority = location.y / SCREEN_HEIGHT * 60;
    NSLog(@"y= %f",priority/60.0);
    float priorityHue = priority/360 ;
    self.itemInfo[@"priority"]= @(priority);
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    
    // infinitie loop = bad
    // [self changeColorWithLocation:location];

}


-(BOOL)prefersStatusBarHidden{return YES; }


@end
