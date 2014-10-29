//
//  SMSSeller.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "SMSSeller.h"
#import <MessageUI/MessageUI.h>
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface SMSSeller ()<MFMessageComposeViewControllerDelegate>

@end

@implementation SMSSeller
{

    PFObject* seller;
    UILabel * sellLabel;
    UIView * whiteView;
    UILabel * sellerName;
    UILabel * numberofTickets;
    UILabel * sectionDetail;
    UILabel * eventDetail;
    UILabel * priceLabel;
    UILabel * TicketsLabel;
    UILabel * eventLabel;
    UILabel * amountofTicketsLabel;
    UILabel * priceTitleLabel;
    UIButton * smsSellerButton;
    UIView * line1;
    UIView * line2;
    UIView * line3;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.navigationController.navigationBar setTranslucent:YES];

    self.view.backgroundColor = [UIColor colorWithRed:0.122f green:0.718f blue:0.871f alpha:1.0f];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    NSLog(@"%@",self.sellerInfo[@"sellerName"]);
   
   
    float w = self.view.bounds.size.width;
    float h = self.view.bounds.size.height;
    
    whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, (h/2), w, (h/2))];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    
    sellLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4, (SCREEN_HEIGHT/100)-30, 300, 200)];
    sellLabel.text = @"tickets";
    sellLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:60];
    sellLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:sellLabel];
    
    
    
    sellerName = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4.5, SCREEN_HEIGHT/4.5, 175, 30)];
    sellerName.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    sellerName.textColor = [UIColor whiteColor];
    sellerName.textAlignment = YES;
    [self.view addSubview:sellerName];
  //  sellerName.textAlignment = YES;
    
    eventDetail = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3.5, SCREEN_HEIGHT/1.85, 200, 100)];
   
    [self.view addSubview:eventDetail];

    
    eventLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14, SCREEN_HEIGHT/1.85, 200, 100)];
    eventLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:22];
    eventLabel.text = @"event";
    
    [self.view addSubview:eventLabel];

    
    line1 = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/1.5, SCREEN_WIDTH, 1)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line1];
    
    
    
   
    amountofTicketsLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14, SCREEN_HEIGHT/1.6, 200, 100)];
    amountofTicketsLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:22];
    amountofTicketsLabel.text = @"amount";
    
    [self.view addSubview:amountofTicketsLabel];
    
    
    numberofTickets = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3.2, SCREEN_HEIGHT/1.45, 30, 30)];
    UILabel * tickets = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.8, SCREEN_HEIGHT/1.45, 75, 30)];
    tickets.text = @"tickets";
    [self.view addSubview:tickets];
    
   
   // numberofTickets.backgroundColor = [UIColor blackColor];
    [self.view addSubview:numberofTickets];
    

    line2 = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/1.35, SCREEN_WIDTH, 1)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    

    
    
    priceTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14, SCREEN_HEIGHT/1.4
                                                               
                                                               
                                                               
                                                               , 200, 100)];
    priceTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:22];
    priceTitleLabel.text = @"title";
    [self.view addSubview:priceTitleLabel];
    
    priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/1.4, 200, 100)];
    [self.view addSubview:priceLabel];
    
    
    line3 = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/1.2, SCREEN_WIDTH, 1)];
    line3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line3];
    

    
    
    seller = self.sellerInfo[@"SellerID"];
    
    eventDetail.text = self.sellerInfo[@"Event"];
    numberofTickets.text = self.sellerInfo[@"NumberOfTicketsSelling"];
    sectionDetail.text = self.sellerInfo[@"Section"];
    sellerName.text = seller[@"username"];
    priceLabel.text = self.sellerInfo[@"PriceForTicket"];
       
    // Do any additional setup after loading the view.


    smsSellerButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/14 , SCREEN_HEIGHT-50, SCREEN_WIDTH- 40 , 40)];
    smsSellerButton.layer.cornerRadius = 5;
    smsSellerButton.backgroundColor = [UIColor colorWithRed:0.122f green:0.718f blue:0.871f alpha:1.0f];
   
    
    [smsSellerButton addTarget:self action:@selector(smstheSeller) forControlEvents:UIControlEventTouchUpInside];
    [smsSellerButton setTitle:@"text the seller" forState:UIControlStateNormal];
    smsSellerButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:25];
    
    
    
    
    [self.view addSubview:smsSellerButton];
    



}

-(void)smstheSeller
{
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    // they want me to send a nsarray but i have a string
    
    NSArray *recipents = @[seller[@"phone"]];
    NSString *message = @"Hi. I saw your tickets listed on NabiT. Can I get more information?";
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
    





}



-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





@end
