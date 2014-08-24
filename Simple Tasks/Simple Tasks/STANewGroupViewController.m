//
//  STANewGroupViewController.m
//  Simple Tasks
//
//  Created by Merritt Tidwell on 7/31/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "STANewGroupViewController.h"

@interface STANewGroupViewController ()

@end

@implementation STANewGroupViewController
{
    UITextField * groupNameField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
        self.view.backgroundColor =[UIColor whiteColor];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    groupNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-40, 40)];
    [self.view addSubview:groupNameField];
    
    // bar that goes belows
    
    UIView * fieldBar = [[UIView alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH-40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];
   
    // returning a keyboard
    
    [groupNameField becomeFirstResponder];
  
    // Cancel Button
    
    UIButton * cancelGroup = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0-110, 80, 100, 100)];
    [cancelGroup setImage:[UIImage imageNamed:@"group_close"] forState:UIControlStateNormal];
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelGroup];
    cancelGroup.adjustsImageWhenHighlighted = NO;
    
    // Save Button
    
    UIButton * saveGroup = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.0+10, 80, 100, 100)];
    [saveGroup setImage:[UIImage imageNamed:@"group_save"] forState:UIControlStateNormal];
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveGroup];
    saveGroup.adjustsImageWhenHighlighted = NO;
    


}


-(void)cancelGroupClicked
{

    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveGroupClicked
{
    
    [self.groups addObject:[@{
                                @"name":groupNameField.text,
                                @"items": [@[] mutableCopy]
                            } mutableCopy]];

    [self dismissViewControllerAnimated:YES completion:nil] ;
    

    
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

\
// removes status bar

-(BOOL)prefersStatusBarHidden{return YES; }


@end
