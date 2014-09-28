//
//  Utility.h
//  tix4u
//
//  Created by Merritt Tidwell on 9/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Utility : NSObject

+ (BOOL)userHasValidFacebookData:(PFUser *)user;
+ (void)processFacebookProfilePictureData:(NSData *)data;

@end
