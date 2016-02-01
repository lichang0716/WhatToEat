//
//  ViewController.h
//  WhatToEat
//
//  Created by lichang on 15/10/25.
//  Copyright © 2015年 lichang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import "define.h"

@interface ViewController : UIViewController

@property (nonatomic) NSArray *foodNameArray;
@property (nonatomic) NSMutableDictionary *foodDetailDic;
@property (nonatomic) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *selectResturantButton;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UILabel *showResultLabel;
- (IBAction)selectFood:(id)sender;
- (IBAction)showResult:(id)sender;


- (NSArray *)getFoodArr;

@end
