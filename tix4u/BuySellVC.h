//
//  BuySellViewController.h
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "ViewController.h"

@interface BuySellVC : ViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIPickerView * ticketPicker;
@property (strong, nonatomic) UIPickerView * ratePicker;
@property (strong, nonatomic) UIPickerView * eventPicker;


@end
