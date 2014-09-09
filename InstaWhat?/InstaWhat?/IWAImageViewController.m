//
//  IWAImageViewController.m
//  InstaWhat?
//
//  Created by Merritt Tidwell on 8/25/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "IWAImageViewController.h"
@interface IWAImageViewController () <UITextViewDelegate>

@end

@implementation IWAImageViewController
{
    UIButton * submitbutton;
    UITextField * text;
    UIImageView * imageView;
    UIView * captionHolder;
 

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    captionHolder = [[UIView alloc]initWithFrame:CGRectMake(0, 310, 320, [UIScreen mainScreen].bounds.size.height-310)];
    captionHolder.backgroundColor = [UIColor lightGrayColor];
    captionHolder.layer.borderWidth= 10;
    captionHolder.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.view addSubview:captionHolder];

    
    UITextView * captionView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20, 280, captionHolder.frame.size.height-70)];
    
    captionView.delegate = self;
    
    
    submitbutton = [[UIButton alloc]initWithFrame:CGRectMake(20, 490 , 280, 60)];
    submitbutton.backgroundColor =[UIColor orangeColor];
    [submitbutton setTitle:@"SUBMIT" forState:UIControlStateNormal];
    
    [submitbutton.titleLabel setFont:[UIFont systemFontOfSize:28]];
    [captionHolder addSubview:captionView];

    
    
    [self.view addSubview:submitbutton];
    
    [self.view addSubview:imageView];
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
   
        // Custom initialization
    }
    return self;
}

-(void)saveFace
{
    PFObject * face = [PFObject objectwithClassName:"Faces"];
    
    [face setObject : captionView.text forKey: ]


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
