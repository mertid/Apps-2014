//
//  sphere.h
//  practice
//
//  Created by Merritt Tidwell on 8/3/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sphere : NSObject

{
    NSArray * _center;
    float _radius;

}

-(void)setRadius:(float)radius;
-(float)radius;


@end
