//
//  Annotation.h
//  tix4u
//
//  Created by Merritt Tidwell on 10/7/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,readonly, copy) NSString * title;


-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
-(void)setTitle:(NSString *)title;

@end


