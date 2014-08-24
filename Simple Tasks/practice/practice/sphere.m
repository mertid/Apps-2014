//
//  sphere.m
//  practice
//
//  Created by Merritt Tidwell on 8/3/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "sphere.h"

@implementation sphere

-(void)setRadius:(float)radius;
{
    _radius = radius;
}

-(float)radius;{

    return _radius;
    
}

-(void)setCenter:(NSArray *)center;
{
    _center = center;
}


-(NSArray *)center;{

    return _center;
}





@end
