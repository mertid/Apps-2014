//
//  TLANewTweetVC.h
//  Tweet Like
//
//  Created by Merritt Tidwell on 8/11/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLANewTweetVC : UIViewController

@property (nonatomic) NSMutableArray * tweets;


@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UIView *greenButton;
@property (weak, nonatomic) IBOutlet UIView *redButton;
@property (nonatomic) UIImageView * saveTweet;




@end
