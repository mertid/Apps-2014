//
//  SMSSeller.m
//  NabiT
//
//  Created by Merritt Tidwell on 10/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "SMSSeller.h"
#import <MessageUI/MessageUI.h>
@interface SMSSeller ()<MFMessageComposeViewControllerDelegate>

@end

@implementation SMSSeller
{

    PFObject* seller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"%@",self.sellerInfo[@"sellerName"]);
   
    seller = self.sellerInfo[@"SellerID"];
    
    _eventDetail.text = self.sellerInfo[@"Event"];
    _numberOfTicketsDetail.text = self.sellerInfo[@"NumberOfTicketsSelling"];
    _sectionDetail.text = self.sellerInfo[@"Section"];
    _sellerNameDetailLabel.text = seller[@"username"];
    _priceLabel.text = self.sellerInfo[@"PriceForTicket"];
       
    // Do any additional setup after loading the view.
}


- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];


}
- (IBAction)smsSellerButton:(id)sender {
    
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
