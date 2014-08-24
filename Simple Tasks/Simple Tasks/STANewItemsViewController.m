//
//  STANewItemsViewController.m
//  Simple Tasks
//
//  Created by Merritt Tidwell on 7/31/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "STANewItemsViewController.h"

@interface STANewItemsViewController () <UITextFieldDelegate>

@end

@implementation STANewItemsViewController

{
    UITextField * itemNameField;
    UIButton * dragButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        self.view.backgroundColor = [UIColor orangeColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 40)];
    UIView * fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
    fieldBar.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:fieldBar];
    [itemNameField becomeFirstResponder];
    itemNameField.delegate =self;
    itemNameField.textColor = [UIColor whiteColor];
    itemNameField.backgroundColor = [UIColor redColor];

    [self.view addSubview:itemNameField];
    
  // declare the height, width, x axies, but not the y should be dynamic float(field).. //

    
    // Cancel button

    
    UIButton * cancelGroup = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0-110, 330, 100, 100)];
    [cancelGroup setImage:[UIImage imageNamed:@"item_close"] forState:UIControlStateNormal];
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelGroup];
    cancelGroup.adjustsImageWhenHighlighted = NO;
    
   // Save Button
    
    UIButton * saveGroup = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0+10, 330, 100, 100)];
    [saveGroup setImage:[UIImage imageNamed:@"item_save"] forState:UIControlStateNormal];
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveGroup];
    saveGroup.adjustsImageWhenHighlighted = NO;
    
    
    // Do any additional setup after loading the view.
     dragButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30, 20, 40, 40)];
    dragButton.backgroundColor = [UIColor blackColor];
    [dragButton addTarget:self action: @selector(buttonDragMethod:withEvent:)forControlEvents:UIControlEventTouchDown];
    
    [dragButton addTarget:self action:@selector(buttonDragMethod:withEvent:)forControlEvents:UIControlEventTouchDragInside];
    
    [self.view addSubview:dragButton];
}

-(void)cancelGroupClicked
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveGroupClicked
{
    
    [self.items addObject:[@{
                              @"name":itemNameField.text,
                              @"priority": @20
                              } mutableCopy]];
    
    [self dismissViewControllerAnimated:YES completion:nil] ;
    
    
    
}
-(void) buttonDragMethod:(id) sender withEvent:(UIEvent *) event
{
    
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    NSLog(@"This is X = %f    Y = %f", point.x, point.y);
    dragButton.center = CGPointMake(dragButton.center.x, point.y);
    
 //[self changeColorWithLocation:[event allTouches]];
    itemNameField.center = CGPointMake(itemNameField.center.x, point.y);
    
    [itemNameField resignFirstResponder];
    
}
-(void)changeColorWithLocation:(CGPoint)location

{
    float priority = location.y / SCREEN_HEIGHT * 60;
    NSLog(@"y= %f",priority/60.0);
    float priorityHue = priority/360 ;
    self.itemInfo[@"priority"]= @(priority);
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    [self changeColorWithLocation:location];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    [textField resignFirstResponder];
    
    return YES;
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

-(BOOL)prefersStatusBarHidden{return YES; }



@end
