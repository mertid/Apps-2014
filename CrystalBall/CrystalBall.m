//
//  CrystalBall.m
//  CrystalBall
//
//  Created by Merritt Tidwell on 9/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "CrystalBall.h"

@implementation CrystalBall

- (NSArray *) predictions {

    if (_predictions == nil) {
     _predictions  = [[NSArray alloc]initWithObjects:
                        @"It is Certain",
                        @"My reply is No",
                        @"It is doubtful",
                        @"Better not tell you now",
                        @"Concentrate and ask me again",
                        @"Unable to answer now",
                        @"The stars are not aligned",
                        nil];

    }
    
    return _predictions;
}

- (NSString*) randomPrediction {
    int random = arc4random_uniform(self.predictions.count);
    return [self.predictions objectAtIndex:random];
}

@end
