//
//  ViewController.m
//  WhatToEat
//
//  Created by lichang on 15/10/25.
//  Copyright © 2015年 lichang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize selectResturantButton = _selectResturantButton;
@synthesize startStopButton = _startStopButton;
@synthesize stopButton = _stopButton;
@synthesize showResultLabel = _showResultLabel;
@synthesize timer = _timer;
@synthesize foodDetailDic = _foodDetailDic;
@synthesize foodNameArray = _foodNameArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getFoodArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectFood:(id)sender {
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(timerFire:)
                                            userInfo:nil
                                             repeats:YES];
    _startStopButton.enabled = NO;
    _stopButton.enabled = YES;
}

- (IBAction)showResult:(id)sender {
    [self stopTimeFire:_timer];
    _startStopButton.enabled = YES;
    _stopButton.enabled = NO;
}

-(NSArray *)getFoodArr{
    NSString *foodPlistPath = [[NSBundle mainBundle] pathForResource:@"FoodList" ofType:@"plist"];
    NSMutableDictionary *foodData = [[NSMutableDictionary alloc] initWithContentsOfFile:foodPlistPath];
    _foodNameArray = [foodData allKeys];
    return _foodNameArray;
}

/******************* 倒计时方法 *********************/
-(void)timerFire:(NSTimer *)timer
{
    int foodNum = _foodNameArray.count;
    int position = arc4random() % foodNum;
    NSString *foodName = _foodNameArray[position];
    [self performSelectorOnMainThread:@selector(changeFoodNameLabel:)
                           withObject:foodName
                        waitUntilDone:YES];
}

- (void)stopTimeFire:(NSTimer *)timer
{
    _startStopButton.titleLabel.text = START;
    [timer setFireDate:[NSDate distantFuture]];
}


- (void)changeFoodNameLabel:(NSString *)str
{
    _showResultLabel.text = str;
}

@end
