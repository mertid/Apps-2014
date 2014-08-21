//
//  LABGraphView.m
//  labyrinth
//
//  Created by Merritt Tidwell on 8/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "LABGraphView.h"

@implementation LABGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.xPlots= [@[]mutableCopy];
        self.yPlots= [@[]mutableCopy];
        self.zPlots= [@[]mutableCopy];
      
        self.backgroundColor = [UIColor whiteColor];
        
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    for(NSNumber * number in self.xPlots)
    {
    
        NSInteger index = [self.xPlots indexOfObject:number];
        
        CGContextMoveToPoint(context, 10*index, 0);
        CGContextAddLineToPoint(context, 10*index, [number floatValue]);
        
    
    }
    
    CGContextStrokePath(context);
    
    
    
    // Drawing code
}


@end
