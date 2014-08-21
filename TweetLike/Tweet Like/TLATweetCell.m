//
//  TLATweetCell.m
//  Tweet Like
//
//  Created by Merritt Tidwell on 8/11/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "TLATweetCell.h"


#import <Parse/Parse.h>

@implementation TLATweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)heartTapped:(id)sender
{
    
    int hearts = [self.tweet[@"hearts"] intValue];
    
    self.tweet[@"hearts"]= @(hearts + 1);
  
    [self.tweet saveInBackground];
    
    [self.delegate heartsUpdated];
    
    
    
}
@end
