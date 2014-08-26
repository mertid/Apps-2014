//
//  IWAImageViewController.m
//  InstaWhat?
//
//  Created by Merritt Tidwell on 8/25/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "IWAImageViewController.h"

@interface IWAImageViewController ()

@end

@implementation IWAImageViewController
{
    UIButton * button;
    UITextField * text;
    UIImageView * imageView;


}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;

    [self.view addSubview:imageView];
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        // Custom initialization
    }
    return self;
}


-(void)setSecondImage:(UIImage *)secondImage

{
    _secondImage = secondImage;
    
    imageView.image = secondImage;
    
    
    
}



- (void)viewDidLoad
{
    
    
    
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
