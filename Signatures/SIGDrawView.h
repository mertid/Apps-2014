//
//  SIGDrawView.h
//  Signatures
//
//  Created by Merritt Tidwell on 8/14/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SIGDrawView : UIView

@property (nonatomic) NSMutableArray * scribbles;
@property (nonatomic) NSMutableArray * currentScribbles;

@property (nonatomic) UIImage * scribblesImage;


@end
