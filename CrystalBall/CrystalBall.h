//
//  CrystalBall.h
//  CrystalBall
//
//  Created by Merritt Tidwell on 9/22/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrystalBall : NSObject {
    NSArray *_predictions;
}

- (NSString *) randomPrediction;

@property(strong, nonatomic,readonly) NSArray * predictions;

@end
