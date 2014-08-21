//
//  TLATweetCell.h
//  Tweet Like
//
//  Created by Merritt Tidwell on 8/11/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PFObject;

@protocol TLATweetCellDelegate;


@interface TLATweetCell : UITableViewCell

- (IBAction)heartTapped:(id)sender;

@property (nonatomic) PFObject * tweet;
@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@property (nonatomic, assign) id <TLATweetCellDelegate> delegate;

@end

@protocol TLATweetCellDelegate <NSObject>

-(void)heartsUpdated;

@end