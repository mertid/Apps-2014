//
//  BuySellViewController.h
//  tix4u
//
//  Created by Merritt Tidwell on 10/1/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "BuySellVC.h"

@interface BuySellVC : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UIPickerView * ticketPicker;
@property (strong, nonatomic) UIPickerView * ratePicker;
@property (strong, nonatomic) UIPickerView * eventPicker;


@end
