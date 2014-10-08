//
//  Constants.h
//  tix4u
//
//  Created by Merritt Tidwell on 9/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Availability.h>

#define NSLOG_DROPCHAFF//comment out to get usual date/time ,etc:2011-11-03 13:43:55.632 myApp[3739:207] Hello Word
#ifdef NSLOG_DROPCHAFF
#define NSLog(__FORMAT__, ...) NSLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#endif

#pragma mark - PFObject User Class
// Field keys
extern NSString *const kPAPUserDisplayNameKey;
extern NSString *const kPAPUserFacebookIDKey;
extern NSString *const kPAPUserPhotoIDKey;
extern NSString *const kPAPUserProfilePicSmallKey;
extern NSString *const kPAPUserProfilePicMediumKey;

@interface Constants : NSObject

@end
