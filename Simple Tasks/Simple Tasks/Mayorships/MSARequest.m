//
//  MSARequest.m
//  Mayorships
//
//  Created by Merritt Tidwell on 8/19/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "MSARequest.h"

#define API @"https://api.foursquare.com/v2/"
#define CLIENT_ID @ "ALWCHUNQNTOEAPJ2S3D1SQA13XXHS3MKWZZ4ZUAXKMX15B2P"
#define CLIENT_SECRET @ "MAOSXVLW40HOBTP4NQNITPEE41GYLG25QINURZW4Q4BTN2JG"

// Venues/search?

// //api.foursquare.com/v2/venues/40a55d80f964a52020f31ee3?oauth_token=XXX&v=YYYYMMDD

@implementation MSARequest

//+(NSArray *)findMayorshipWithLocation:(CLLocation *)location
+(void)findMayorshipsWithLocation:(CLLocation *)location completion:(void (^)(NSArray * mayors))completion
{
    [MSARequest findVenuesWithLocation:location completion:^(NSArray *venues) {
        
        NSMutableArray * mayors = [@[]mutableCopy];
        for (NSDictionary * venue in venues)
        {
            NSString * endpoint = [NSString stringWithFormat:@"venues/%@",venue[@"id"]];
            
            //       NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{}];
            
            [MSARequest foursquareRequestWithEndpoint:endpoint andParameters:@{} completion:^(NSDictionary *responseInfo) {
                
                NSDictionary * mayor = responseInfo[@"response"][@"venue"][@"mayor"];
                
                if (mayor[@"count"]>0 ) {
                 
                    if(mayor)[mayors addObject:mayor];
                    if(completion)completion (mayors);

                }
            }];
            // return mayors;
        }
    }];
}

+ (void)findVenuesWithLocation:(CLLocation *)location completion:(void(^)(NSArray * venues))completion
{
    NSDictionary * parameters = @{
                                  @"ll" : [ NSString stringWithFormat:@"%f,%f",     location.coordinate.latitude,
                                           location.coordinate.longitude]
                                  };
    
    [MSARequest foursquareRequestWithEndpoint:@"venues/search"andParameters:parameters completion:^(NSDictionary * responseInfo){
        
        if (completion)
        {
            completion(responseInfo[@"response"][@"venues"]);
        }
    }];
}

+(void)foursquareRequestWithEndpoint:(NSString *)endpoint andParameters:
(NSDictionary *)parameters completion:(void(^)(NSDictionary * responseInfo))completion
{
    
    NSMutableString * requestString = [[API stringByAppendingString:endpoint ]mutableCopy];
    
    // MAke v custom to current day
    
    [requestString appendString:[NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=20140819",CLIENT_ID,CLIENT_SECRET]];
    
    for (NSString * key in [parameters allKeys])
    {
        if([requestString length]>0)
        {
            [requestString appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
        }
    }
    NSLog(@"%@",requestString);
    
    NSURL * requestURL = [NSURL URLWithString:requestString];
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    //  NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError)
        {
            NSLog(@"%@", connectionError);
        }
        
        NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"Connected to URL: %@\n%@", requestURL, responseInfo);
        if (completion) completion(responseInfo);
        
    }];
    
    //  NSLog(@"%@",responseInfo[@"response"][@"venues"]);
}

@end
